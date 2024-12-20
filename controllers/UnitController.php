<?php

namespace app\controllers;

use app\models\ItemUnit;
use app\models\UnitSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use Yii;
use app\models\Item;
use app\models\ItemSearch;
use app\models\Warehouse;
use app\models\Lending;
use yii\helpers\ArrayHelper;
use app\models\DamagedSearch;
use app\models\UploadForm;
use PhpOffice\PhpSpreadsheet\IOFactory;
use yii\web\UploadedFile;
use app\models\DocUploaded;
use app\models\StatusLookup;
use app\models\ConditionLookup;
use app\models\UploadPicture;
use app\helpers\TranslationHelper;
use webvimark\modules\UserManagement\models\User as WebvimarkUser;
use app\controllers\LogController;

/**
 * UnitController implements the CRUD actions for ItemUnit model.
 */
class UnitController extends Controller
{
    /**
     * @inheritDoc
     */
    

   
    public function behaviors()
    {
    	return [
    		'ghost-access'=> [
    			'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
    		],
    	];
    }



    /**
     * Lists all ItemUnit models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ItemSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);



        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ItemUnit model.
     * @param int $id_unit Id Unit
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_unit)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_unit),
        ]);
    }

    	   /**
    * Creates a new ItemUnit model.
    * If creation is successful, the browser will be redirected to the 'view' page.
    * @return string|\yii\web\Response
    */
   public function actionCreate()
   {
       $model = new ItemUnit();
       if ($this->request->isPost) {
           if ($model->load($this->request->post()) && $model->save()) {
               return $this->redirect(['view', 'id_unit' => $model->id_unit]);
           }
       } else {
           $model->loadDefaultValues();
       }
       return $this->render('create', [
           'model' => $model,
       ]);
   }

   public function actionDamaged()
   {
       // Initialize search model
       $searchModel = new DamagedSearch();

       $statusList = StatusLookup::getStatusList();
       $conditionList = ConditionLookup::getConditionList();
       $warehouseList = Warehouse::getWarehouseList();
   
       // Filter the data based on search input
       $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
   
       return $this->render('damaged', [
           'searchModel' => $searchModel,
           'dataProvider' => $dataProvider,
           'statusList' => $statusList,
           'conditionList' => $conditionList,
           'warehouseList' => $warehouseList,
       ]);
   }
   

   public function actionRepair(){
        $searchModel = new DamagedSearch();
        
        // Load the query parameters and filter accordingly
        $dataProvider = $searchModel->searchRepair(Yii::$app->request->queryParams);

        $statusList = StatusLookup::getStatusList();
        $conditionList = ConditionLookup::getConditionList();
        $warehouseList = Warehouse::getWarehouseList();

    
        return $this->render('repair', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'statusList' => $statusList,
            'conditionList' => $conditionList,
            'warehouseList' => $warehouseList,
        ]);
    }


    public function actionAddUnit($id_item)
    {
        $model = new ItemUnit();
        
        // Set the $id_item in the model
        $model->id_item = $id_item;
        $model->condition = 1;  // Default value for 'condition' it means the condition is 'OK'
        $model->status = 1;     // Default value for 'status' it means the status is 'Available'

        $warehouses = Warehouse::find()->all();

        // Prepare warehouse data as [id_wh => wh_name] for the dropdown
        $whList = ArrayHelper::map($warehouses, 'id_wh', 'wh_name');
    
        if ($model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                if ($model->serial_number == NULL) {
                    $item = Item::findOne($model->id_item);
                    if ($model->id_wh == NULL) {
                        Yii::$app->session->setFlash('error', TranslationHelper::translate('Warehouse not allowed to be null for new unit.'));
                        return $this->redirect("add-unit?id_item=$id_item");
                    }
                    if ($model->comment==NULL){
                        $model->comment = 'New Unit';
                    }
                    if ($item !== null && !empty($item->SKU)) {
                        // Get the first 3 characters of the SKU
                        $skuPrefix = $item->SKU;
                        
                        // Combine the SKU prefix and the random number to create the serial number
                        $model->serial_number = $row['B'] ?? $this->generateUniqueSerialNumber($skuPrefix);
                    } else {
                        throw new NotFoundHttpException(TranslationHelper::translate("Item not found or SKU is empty."));
                    }
                }
                $user = Yii::$app->user->identity;
                $model->updated_by = $user->id;
            if ($model->save()){
                Yii::$app->session->setFlash('success', TranslationHelper::translate('Unit Added successfully.'));
                $serial_n = $model->serial_number;
                $id_unit = $model->id_unit;

                $logController = new LogController('log', Yii::$app); // Pass the required parameters to the controller
                $logController->actionNewUnit($serial_n, $id_unit);
                return $this->redirect(['index']);
            }
            }
        }
    
        return $this->render('add-unit', [
            'model' => $model,
            'whList' => $whList,
        ]);
    }
    

    public function actionReturnUnit($id_unit)  
    {
        $model = $this->findModel($id_unit);
        if (!$model) {
            throw new NotFoundHttpException(TranslationHelper::translate('The requested ItemUnit does not exist.'));
        }

        $uploadModel = new UploadPicture();

        $warehouses = Warehouse::find()->all();
        $whList = ArrayHelper::map($warehouses, 'id_wh', 'wh_name');

        // Condition lookup
        $condlist = ConditionLookup::getConditionList();

        if (Yii::$app->request->isPost && $model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                // Set the status based on the condition value from the POST request
                if ($model->condition == 5) {
                    $model->status = 4; // Set status to 4 (Damaged) or lost
                } elseif ($model->condition == 4) {
                    $model->status = 4; // set status to 4 (Damaged) or lost
                } else {
                    $model->status = 1; // set status to 1 (Available)
                }
                $user = Yii::$app->user->identity;
                $user_id = $user->id;
                $model->updated_by = $user_id;
                // Save the ItemUnit model after setting the status
                if ($model->save(false)) {
                    // Find the latest Lending record for this unit
                    $lending = Lending::find()->where(['id_unit' => $model->id_unit])
                        ->orderBy(['id_lending' => SORT_DESC]) // Get the latest entry
                        ->one();
                    
                    //pic 
                    $uploadModel->imageFile = UploadedFile::getInstance($uploadModel, 'imageFile');

                    Yii::debug($uploadModel->imageFile, 'Uploaded File Details');
                    
                    if ($uploadModel->imageFile && $uploadModel->validate()) {
                        if ($uploadModel->imageFile) {
                            $imageFileName = $uploadModel->upload();
                            if ($imageFileName) {
                                $lending->pic_return = $imageFileName;
                            }
                            Yii::debug('Uploaded file name: ' . $uploadModel->imageFile->name, __METHOD__);
                        } else {
                            Yii::error('No file uploaded.', __METHOD__);
                            Yii::$app->session->setFlash('error', TranslationHelper::translate('Please upload a picture.'));
                            return $this->redirect(['return-unit', 'id_unit' => $lending->id_unit]); // Redirect back
                        }

                        } else {
                            Yii::error("Upload model validation failed", __METHOD__);
                            if (!$uploadModel->validate()) {
                                Yii::error('Upload model validation failed: ' . json_encode($uploadModel->errors), __METHOD__);
                                var_dump($uploadModel->errors); // This will show validation error details on-screen
                                die();
                            }// Dump errors to check on screen
                            Yii::$app->session->setFlash('error', TranslationHelper::translate('Please upload of unit picture'));
                            return $this->redirect(['index']);
                        }

                        if ($lending) {
                            $date = date('Y-m-d');
                            // Update the Lending record
                            $lending->type = 2; // Set type to 2 for return
                            $lending->date = $date; // Update the date
                            $lending->save(false); // Save the changes without validation
                        
                        }
                    $logController = new LogController('log', Yii::$app); // Pass the required parameters to the controller
                    $logController->actionReturnLog($model->id_unit, $lending->id_employee);
                    Yii::$app->session->setFlash('success', TranslationHelper::translate('Unit Returned successfully.'));
                    return $this->redirect(['lending/list']);
                }
            }
        }

        return $this->render('return-unit', [
            'model' => $model,
            'whList' => $whList,
            'condlist' => $condlist,
            'uploadModel' => $uploadModel,
        ]);
    }

    

    /**
     * Updates an existing ItemUnit model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_unit Id Unit
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_unit)
    {
        $model = $this->findModel($id_unit);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', TranslationHelper::translate('Unit Updated successfully.'));
            return $this->redirect(['view', 'id_unit' => $model->id_unit]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing ItemUnit model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_unit Id Unit
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_unit)
    {
        $this->findModel($id_unit)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the ItemUnit model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_unit Id Unit
     * @return ItemUnit the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_unit)
    {
        if (($model = ItemUnit::findOne(['id_unit' => $id_unit])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(TranslationHelper::translate('The requested page does not exist.'));
    }

    public function actionWarehouseDistribution($id_item){
        $model = new ItemUnit();
        $data = $model->getWhDistribution($id_item);
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }

    public function actionItemDetail($id_item){
        $model = new ItemUnit();
        $data = $model->getItemDetail($id_item);
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }


    public function actionAvailableUnit($id_item){
        $model = new ItemUnit();
        $data = $model->getAvailableUnit($id_item);
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }

    
    public function actionAvailableLending(){
        $model = new ItemUnit();
        $data = $model->getListAvailableLending();
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }

    public function actionUnitRepair(){
        $model = new ItemUnit();
        $data = $model->getUnitRepair();
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }

    public function actionBrokenUnit(){
        $model = new ItemUnit();
        $data = $model->getBrokenUnit();
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }

    public function actionCorrectionSearch()
    {
        $model = new ItemUnit();
    
        if ($model->load(Yii::$app->request->post())) {
            if ($model->serial_number !== null) {
                $serial_number = $model->serial_number;
                // Call actionCorrectionUnit with the serial number
                return $this->redirect(['correction-unit', 'serial_number' => $serial_number]);
            } else {
                // Handle the case when serial_number is not provided
                Yii::$app->session->setFlash('error', TranslationHelper::translate('Serial number cannot be null.'));
            }
        }
    
        return $this->render('correction-search', [
            'model' => $model,
        ]);
    }
    
    
    public function actionCorrectionUnit($serial_number)
    {
        // Find the item unit by serial number (ensure that serial_number is a valid column)
        $model = ItemUnit::find()->where(['serial_number' => $serial_number])->one();
        
        //Warehouse name lookup
        $warehouses = Warehouse::find()->all();
        $whList = ArrayHelper::map($warehouses, 'id_wh', 'wh_name');

        // Condition lookup
        $condlist = ConditionLookup::getConditionList();

        //status lookup
        $stats = StatusLookup::find()->all();
        $statslist = ArrayHelper::map($stats, 'id_status', 'status_name');

        // Check if the model was found
        if ($model === null) {
            Yii::$app->session->setFlash('error', TranslationHelper::translate('Serial number cannot be found. Check if you mistyped it.'));
            return $this->redirect(['correction-search']);
        }
    
        // If model is found, load and validate the form data
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $user = Yii::$app->user->identity;
            $model->updated_by = $user->id;
            $model->save();
            $logController = new LogController('log', Yii::$app); // Pass the required parameters to the controller
            $logController->actionEditLog($serial_number);
            Yii::$app->session->setFlash('success', TranslationHelper::translate('Unit updated successfully.'));
            return $this->redirect('/item/details?id_item='.$model->id_item); // Prevents form resubmission
        }
    
        return $this->render('correction-unit', [
            'model' => $model,
            'whList' => $whList,
            'condlist' => $condlist,
            'statslist' => $statslist,//not showing status name
        ]);
    }
    
    

    public function actionSendRepair($id_unit)
    {
        $unit = ItemUnit::findOne(['id_unit'=>$id_unit]);
        $model = $this->findModel($id_unit);
        if (!$unit) {
            throw new NotFoundHttpException(TranslationHelper::translate('The requested ItemUnit does not exist.'));
        }
        $user = Yii::$app->user->identity;
        $model->id_unit = $id_unit;
        $model->status = 3;
        $model->id_item = $unit->id_item;
        $model->condition = $unit->condition;
        //$model->id_wh = NULL;
        $model->updated_by = $user->id;
        if ($model->load(Yii::$app->request->post())) {

            if ($model->validate()) {
                if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
                    $logController = new LogController('log', Yii::$app); // Pass the required parameters to the controller
                    $logController->actionRepairLog($model->id_unit);
                    $repairLog = new RepairLogController('repair', Yii::$app);
                    $type = 1;
                    $repairLog->actionCreate($id_unit, $model->comment, $type);
                    Yii::$app->session->setFlash('success', TranslationHelper::translate('Unit sent to repair successfully.'));
                    return $this->redirect(['damaged']);
                }
                return;
            }
        }

        return $this->render('send-repair', [
            'model' => $model,
        ]);
    }

    public function actionFinishRepair($id_unit)
    {
        $unit = ItemUnit::findOne(['id_unit'=>$id_unit]);
        $model = $this->findModel($id_unit);

        //wh list
        $warehouses = Warehouse::find()->all();
        $whList = ArrayHelper::map($warehouses, 'id_wh', 'wh_name');
        // Condition lookup
        $condlist = ConditionLookup::getConditionList();
        
        if (!$unit) {
            throw new NotFoundHttpException(TranslationHelper::translate('The requested ItemUnit does not exist.'));
        }
        $user = Yii::$app->user->identity;
        $model->id_unit = $id_unit;
        $model->status = 1; //status 1 = available
        $model->id_item = $unit->id_item;
        $model->condition = $unit->condition;
        $model->updated_by = $user->id;
        if ($model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
                    $logController = new LogController('log', Yii::$app); // Pass the required parameters to the controller
                    $logController->actionDoneRepairLog($model->id_unit);
                    $repairLog = new RepairLogController('repair', Yii::$app);
                    $type = 2;
                    $repairLog->actionCreate($id_unit, $model->comment, $type);
                    Yii::$app->session->setFlash('success', TranslationHelper::translate('Unit repaired and updated.'));
                    return $this->redirect(['repair']);
                }
                return;
            }
        }

        return $this->render('finish-repair', [
            'model' => $model,
            'condlist' => $condlist,
            'whList' => $whList,
        ]);
    }

    public function actionBulkAdd($id_item)
    {
        $model = new UploadForm();
        $session = Yii::$app->session;
        $filemod = new DocUploaded();
    
        if (Yii::$app->request->isPost) {
            $model->file = UploadedFile::getInstance($model, 'file');
    
            if ($model->file && $model->validate()) {
                // Save the uploaded file
                $filename = $model->upload();
                $filePath = $filename['filePath'];
                $fileName = $filename['fileName'];
    
                if ($filePath) {
                    // Store the uploaded file in the database
                    $filemod->file_name = $fileName;
                    $filemod->user_id = Yii::$app->user->id;
                    $filemod->datetime = new \yii\db\Expression('NOW()');
                    $filemod->save();
    
                    // Load the spreadsheet
                    $spreadsheet = IOFactory::load($filePath);
                    $sheet = $spreadsheet->getActiveSheet();
    
                    // Retrieve the item and SKU prefix
                    $item = Item::findOne($id_item);
                    $skuPrefix = $item->SKU;
    
                    // Generate unique serial numbers
                    $unitData = [];
                    $existingSerials = ItemUnit::find()
                        ->select(['serial_number'])
                        ->where(['like', 'serial_number', "{$skuPrefix}-%", false])
                        ->asArray()
                        ->column();
                    
                    $serialTracker = array_flip($existingSerials);
    
                    foreach ($sheet->toArray(null, true, true, true) as $rowIndex => $row) {
                        if ($rowIndex == 1) continue; // Skip header

                        $serialNumber = $row['B'] ?? null;
    
                        if ($serialNumber && isset($serialTracker[$serialNumber])) {
                            Yii::$app->session->setFlash('error', TranslationHelper::translate("Serial number '{$serialNumber}' is not unique. Please ensure all serial numbers are unique."));
                            return $this->redirect(['index']);
                        }
    
                        // Auto-generate if serial number is empty
                        if (!$serialNumber) {
                            do {
                                $serialNumber = $this->generateUniqueSerialNumberBulk($skuPrefix, $serialTracker);
                            } while (isset($serialTracker[$serialNumber]));
                        }
                        //add checking for each to check $id_wh = row['A'] with  $user_wh = Yii::$app->user->identity->id_wh; if (WebvimarkUser::hasRole('Admin') && !WebvimarkUser::hasRole('superadmin'))
                        //inside that if user_wh != $id_wh setflash error and redirect to index
                        $user_wh = Yii::$app->user->identity->id_wh; 
                        $id_wh = $row['A'];
                        if (WebvimarkUser::hasRole('Admin') && !WebvimarkUser::hasRole('superadmin')){
                            if($user_wh != $id_wh){
                                Yii::$app->session->setFlash('error', TranslationHelper::translate("Warehouse admin is not allowed to add unit to another warehouse not they're assigned to"));
                            return $this->redirect(['index']);
                            }
                        }
                        // Mark the serial number as used
                        $serialTracker[$serialNumber] = true;
    
                        $unitData[] = [
                            'id_item' => $id_item,
                            'status' => 1,
                            'id_wh' => $row['A'] ?? null,
                            'condition' => 1,
                            'serial_number' => $serialNumber,
                            'comment' => $row['C'] ?? 'New Unit',
                            'updated_by' => Yii::$app->user->id,
                        ];
    
                        // Update the spreadsheet
                        $sheet->setCellValue("A$rowIndex", $row['A'] ?? null); // Warehouse ID
                        $sheet->setCellValue("B$rowIndex", $serialNumber);      // Serial Number
                        $sheet->setCellValue("C$rowIndex", $row['C'] ?? 'New Unit'); // Comment
                    }
    
                    // Save updated spreadsheet
                    $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
                    $writer->save($filePath);
    
                    // Store unit data for preview
                    $session->set('unitData', $unitData);
                    $session->set('uploadedFileName', $fileName);
    
                    // Redirect to preview page
                    return $this->redirect(['bulk-add-preview']);
                } else {
                    Yii::$app->session->setFlash('error', TranslationHelper::translate('Failed to save uploaded file.'));
                    return $this->redirect(['index']);
                }
            }
        }
    
        return $this->render('mass-unit', ['model' => $model]);
    }
    
    public function actionBulkAddPreview()
    {
        $session = Yii::$app->session;
        $unitData = $session->get('unitData', []);
    
        if (Yii::$app->request->isPost) {
            foreach ($unitData as $data) {
                $unit = new ItemUnit($data);
                $unit->save(false); // Save without validation
                $logController = new LogController('log', Yii::$app); // Pass the required parameters to the controller
                $logController->actionNewUnit($unit->serial_number, $unit->id_unit);
            }
    
            $session->remove('unitData'); // Clear session data
            Yii::$app->session->setFlash('success', TranslationHelper::translate('Data saved successfully.'));
            return $this->redirect(['index']);
        }
    
        return $this->render('bulk-add-preview', ['unitData' => $unitData]);
    }
    
    

    protected function generateUniqueSerialNumber($skuPrefix)
    {
        // Find the maximum current number with the same prefix
        $latestSerial = ItemUnit::find()
            ->select(['serial_number'])
            ->where(['like', 'serial_number', "{$skuPrefix}-%", false])
            ->orderBy(['serial_number' => SORT_DESC])
            ->one();
        
        if ($latestSerial) {
            // Extract the numeric part and increment it by 1
            $currentNumber = (int) substr($latestSerial->serial_number, -4);
            $newNumber = str_pad($currentNumber + 1, 4, '0', STR_PAD_LEFT);
        } else {
            // Start with 0001 if no previous serial number exists
            $newNumber = '0001';
        }
        // the rule for the serial number is SKU then separated by a dash ' - ' and then serialized number
        // Construct the new serial number
        return $skuPrefix . '-' . $newNumber;
    }
    
    protected function generateUniqueSerialNumberBulk($skuPrefix, &$serialTracker)
    {
        // Find the next available number
        $maxNumber = 0;
        foreach (array_keys($serialTracker) as $serial) {
            if (strpos($serial, $skuPrefix . '-') === 0) {
                $numberPart = (int) substr($serial, -4);
                $maxNumber = max($maxNumber, $numberPart);
            }
        }
    
        $newNumber = str_pad($maxNumber + 1, 4, '0', STR_PAD_LEFT);
        return $skuPrefix . '-' . $newNumber;
    }

    public function actionCheck(){
        if (WebvimarkUser::hasRole('superadmin')) {
           echo'User is superadmin';
        } else {
            echo'User is not superadmin';
        }
        
    }

}
