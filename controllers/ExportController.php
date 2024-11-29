<?php

namespace app\controllers;

use app\helpers\TranslationHelper;
use app\models\WarehouseSearch;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use app\models\Item;
use app\models\ItemUnit;
use app\models\Lending;
use app\models\UnitLog;
use Yii;
use app\models\ItemSearch;
use app\models\Warehouse;
use app\models\LogSearch;
use app\models\UnitSearch;
use app\models\LendingSearch;
use app\models\DamagedSearch;
use app\models\RepairLogSearch;

class ExportController extends \yii\web\Controller
{

    
    // Define a class property
    protected $username;

    // Initialize the property in the constructor
    public function __construct($id, $module, $config = [])
    {
        parent::__construct($id, $module, $config);

        // Set the username property
        $this->username = Yii::$app->user->identity->username;
    }


    public function behaviors()
    {
    	return [
    		'ghost-access'=> [
    			'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
    		],
    	];
    }
    public function actionIndex()
    {
        return $this->render('index');
    }
    
    public function actionExportXlsx()
    {
        // Fetch data (for example, from a model)
        $items = Item::find()->all();  // Adjust as per your model

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', 'ID');
        $sheet->setCellValue('B1', 'Name');
        $sheet->setCellValue('C1', 'Status');

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item->id);
            $sheet->setCellValue('B' . $row, $item->name);
            $sheet->setCellValue('C' . $row, $item->status);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_data_' . date('Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }

    public function actionExportLending()
    {
        
        $searchModel = new LendingSearch();

        //filter params
        $params = Yii::$app->request->post();

        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['lending/list']);
        }
        //echo var_dump($params);
        //exit();
        // Get the data provider with params applied
        $dataProvider = $searchModel->search($params);
        $dataProvider->pagination = false; // Disable pagination for export

        $items = $dataProvider->getModels(); // Retrieve data with filters applied
        
        // Fetch data (for example, from a model)
        //$lendingmodel = new Lending();
        //$items = $lendingmodel->getLendingList();  // change it to calling getLendingList in Lending model

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('B1', TranslationHelper::translate('employee'));
        $sheet->setCellValue('C1', TranslationHelper::translate('updated_by'));
        $sheet->setCellValue('D1', TranslationHelper::translate('comment'));
        $sheet->setCellValue('E1', TranslationHelper::translate('date'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['serial_number']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['employee']);
            $sheet->setCellValue('C' . $row, $item['updated_by']);
            $sheet->setCellValue('D' . $row, $item['comment']);
            $sheet->setCellValue('E' . $row, $item['date']);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_lending_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }

    public function actionExportDamaged()
    {
        $unitModel = new ItemUnit();
        $damagedlist = $unitModel->getBrokenUnit();

        //filter params
         $params = Yii::$app->request->post();   
        // Initialize search model

        $searchModel = new DamagedSearch();
        
        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['unit/damaged']);
        }
        // Filter the data based on search input
        $dataProvider = $searchModel->search($params, $damagedlist);
        $dataProvider->pagination = false; // Disable pagination for export

        $items =  $dataProvider->getModels(); // Retrieve data with filters applied

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('Unit condition'));
        $sheet->setCellValue('B1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('C1', TranslationHelper::translate('status'));
        $sheet->setCellValue('D1', TranslationHelper::translate('warehouse'));
        $sheet->setCellValue('E1', TranslationHelper::translate('comment'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, TranslationHelper::translate($item['condition']));  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['serial_number']);
            $sheet->setCellValue('C' . $row, TranslationHelper::translate($item['status']));
            $sheet->setCellValue('D' . $row, $item['warehouse']);
            $sheet->setCellValue('E' . $row, $item['comment']);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_damaged_unit_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
            
    }

    public function actionExportRepair()
    {
        $searchModel = new DamagedSearch();
        
        $params = Yii::$app->request->post();

        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['unit/repair']);
        }
        //echo var_dump($params);
        //exit();
        // Get the data provider with params applied
        $dataProvider = $searchModel->searchRepair($params);
        $dataProvider->pagination = false; // Disable pagination for export

        $items = $dataProvider->getModels(); 

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('unit condition'));
        $sheet->setCellValue('B1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('C1', TranslationHelper::translate('status'));
        $sheet->setCellValue('D1', TranslationHelper::translate('updated_by'));
        $sheet->setCellValue('E1', TranslationHelper::translate('comment'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, TranslationHelper::translate($item['condition']));  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['serial_number']);
            $sheet->setCellValue('C' . $row, TranslationHelper::translate($item['status']));
            $sheet->setCellValue('D' . $row, $item['updated_by']);
            $sheet->setCellValue('E' . $row, $item['comment']);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_unit_inrepair_data_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }

    public function actionExportLog()
    {
        $searchModel = new LogSearch();
        
        // Load parameters from POST
        $params = Yii::$app->request->post();
    
        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['log/index']);
        }
    
        // Get the data provider with params applied
        $dataProvider = $searchModel->search($params);
        $dataProvider->pagination = false; // Disable pagination for export
    
        $items = $dataProvider->getModels(); // Retrieve data with filters applied
    
        // Create Spreadsheet object and export logic (same as before)
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
    
        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('B1', TranslationHelper::translate('content'));
        $sheet->setCellValue('C1', TranslationHelper::translate('log date'));
    
        // Populate data
        $row = 2;
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['serial_number']);
            $sheet->setCellValue('B' . $row, TranslationHelper::translate($item['content']));
            $sheet->setCellValue('C' . $row, $item['log_date']);
            $row++;
        }
    
        // Set filename and export
        $filename = 'exported_log_all_data_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);
    
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }
    
    

    public function actionExportLogSingle($serial_number)
    {
        $itemmodel = new UnitLog();
        $items = $itemmodel->getLogSingle($serial_number); 

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();



        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('B1', TranslationHelper::translate('content'));
        $sheet->setCellValue('C1', TranslationHelper::translate('log date'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['serial_number']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, TranslationHelper::translate($item['content']));
            $sheet->setCellValue('C' . $row, $item['log_date']);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_log'.$serial_number.'_data_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }

    public function actionExportMain(){
        $searchModel = new ItemSearch();

        // Load parameters from POST
        $params = Yii::$app->request->post();

        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['item/index']);
        }

        // Get the data provider with params applied
        $dataProvider = $searchModel->search($params);
        $dataProvider->pagination = false; // Disable pagination for export
    
        $items = $dataProvider->getModels(); // Retrieve data with filters applied
    
        // Create Spreadsheet object and export logic (same as before)


        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('item_name'));
        $sheet->setCellValue('B1', 'SKU');
        $sheet->setCellValue('C1', TranslationHelper::translate('available in warehouse'));
        $sheet->setCellValue('D1', TranslationHelper::translate('in_use'));
        $sheet->setCellValue('E1', TranslationHelper::translate('in-repair'));
        $sheet->setCellValue('F1', TranslationHelper::translate('unit lost'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['item_name']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['SKU']);
            $sheet->setCellValue('C' . $row, $item['available']);
            $sheet->setCellValue('D' . $row, $item['in_use']);
            $sheet->setCellValue('E' . $row, $item['in_repair']);
            $sheet->setCellValue('F' . $row, $item['lost']);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_master_inventory_data_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }

    public function actionItemDetail($id_item){
        $searchModel = new UnitSearch();

        //params filter
        $params = Yii::$app->request->post();

        // Load parameters directly into the search model to ensure they apply
        //if (!$searchModel->load($params) || !$searchModel->validate()) {
        //    // If params do not load or validate, handle it (e.g., return all data or show an error)
        //    Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
        //    return $this->redirect(['item/details?id_item='.$id_item]);
        //}

        
        // Get the data provider with params applied
        $dataProvider = $searchModel->search($params, $id_item);
        $dataProvider->pagination = false; // Disable pagination for export

        $items = $dataProvider->getModels(); 

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('unit condition'));
        $sheet->setCellValue('B1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('C1', TranslationHelper::translate('id_unit'));
        $sheet->setCellValue('D1', TranslationHelper::translate('status'));
        $sheet->setCellValue('E1', TranslationHelper::translate('updated_by'));
        $sheet->setCellValue('F1', TranslationHelper::translate('warehouse'));
        $sheet->setCellValue('G1', TranslationHelper::translate('employee'));
        $sheet->setCellValue('H1', TranslationHelper::translate('comment'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, TranslationHelper::translate($item['condition']));  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['serial_number']);
            $sheet->setCellValue('C' . $row, $item['id_unit']);
            $sheet->setCellValue('D' . $row, TranslationHelper::translate($item['status']));
            $sheet->setCellValue('E' . $row, $item['updated_by']);
            $sheet->setCellValue('F' . $row, $item['warehouse']);
            $sheet->setCellValue('G' . $row, $item['employee']);
            $sheet->setCellValue('H' . $row, $item['comment']);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_master_inventory_data_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }


    public function actionWarehouse($id_wh){
        $model = new Warehouse();
        $items = $model->getExport($id_wh);

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('item_name'));
        $sheet->setCellValue('B1', 'SKU');
        $sheet->setCellValue('C1', TranslationHelper::translate('available in warehouse'));
        $sheet->setCellValue('D1', TranslationHelper::translate('in_use'));
        $sheet->setCellValue('E1', TranslationHelper::translate('unit lost'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['item_name']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['SKU']);
            $sheet->setCellValue('C' . $row, $item['available']);
            $sheet->setCellValue('D' . $row, $item['in_use']);
            $sheet->setCellValue('E' . $row, $item['lost']);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_warehouse_data_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }
    
    //item detail in warehouse export
    public function actionWhDist($id_item) {
        $model = new ItemUnit();
        $items = $model->getWhDistribution($id_item) ?? [];
    
        $wh_mod = new WarehouseSearch();
        $repairs = $wh_mod->searchInRepair(Yii::$app->request->queryParams, $id_item);
    
        // Extract data from ArrayDataProvider
        $repairsData = $repairs->getModels();
        $totalInRepair = array_sum(array_column($repairsData, 'in_repair')); // Sum up 'in_repair' values
    
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
    
        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('warehouse'));
        $sheet->setCellValue('B1', TranslationHelper::translate('available in warehouse'));
        $sheet->setCellValue('C1', TranslationHelper::translate('in_use'));
        $sheet->setCellValue('D1', TranslationHelper::translate('unit lost'));
    
        // Populate data
        $row = 2;
        foreach ($items as $item) {
            if (!is_array($item)) continue; // Skip invalid entries
            $sheet->setCellValue('A' . $row, $item['warehouse'] ?? 'N/A');
            $sheet->setCellValue('B' . $row, $item['available'] ?? 0);
            $sheet->setCellValue('C' . $row, $item['in_use'] ?? 0);
            $sheet->setCellValue('D' . $row, $item['lost'] ?? 0);
            $row++;
        }
        $row++;
        // Add in-repair data
        $sheet->setCellValue('A' . $row, 'Units In-repair');
        $row++;
        $sheet->setCellValue('A' . $row, $totalInRepair);
    
        // Export file
        $filename = 'exported_item_in_warehouses_data_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);
    
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }
    
    

    public function actionExportItemReport()
    {
        //filter params
         $params = Yii::$app->request->post();   
        // Initialize search model

        $searchModel = new LendingSearch();
        
        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['lending/item-report-active']);
        }
        // Filter the data based on search input
        $dataProvider = $searchModel->searchItemReport($params);
        $dataProvider->pagination = false; // Disable pagination for export

        $items =  $dataProvider->getModels(); // Retrieve data with filters applied

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('item_name'));
        $sheet->setCellValue('B1', 'SKU');
        $sheet->setCellValue('C1', TranslationHelper::translate('total_item_lent'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['item_name']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['SKU']);
            $sheet->setCellValue('C' . $row, $item['total_item_lent']);
            $row++;
        }

        // Set filename and export
        $filename = 'export_loan_item_report' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
            
    }
    
    public function actionExportUnitReport()
    {
        //filter params
         $params = Yii::$app->request->post();   
        // Initialize search model

        $searchModel = new LendingSearch();
        
        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['lending/item-report-active']);
        }
        // Filter the data based on search input
        $dataProvider = $searchModel->searchUnitReport($params);
        $dataProvider->pagination = false; // Disable pagination for export

        $items =  $dataProvider->getModels(); // Retrieve data with filters applied

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('item_name'));
        $sheet->setCellValue('B1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('C1', TranslationHelper::translate('number_of_times_unit_is_lent'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['item_name']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['serial_number']);
            $sheet->setCellValue('C' . $row, $item['number_of_times_unit_is_lent']);
            $row++;
        }

        // Set filename and export
        $filename = 'export_loan_unit_report' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
            
    }

    public function actionExportLendingHistory()
    {
        $searchModel = new LendingSearch();

        //filter params
        $params = Yii::$app->request->post();

        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['lending/lending-history']);
        }
        //echo var_dump($params);
        //exit();
        // Get the data provider with params applied
        $dataProvider = $searchModel->searchLendingHistory($params);
        $dataProvider->pagination = false; // Disable pagination for export

        $items = $dataProvider->getModels(); // Retrieve data with filters applied
        
        // Fetch data (for example, from a model)
        //$lendingmodel = new Lending();
        //$items = $lendingmodel->getLendingList();  // change it to calling getLendingList in Lending model

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('B1', TranslationHelper::translate('employee'));
        $sheet->setCellValue('C1', TranslationHelper::translate('updated_by'));
        $sheet->setCellValue('D1', TranslationHelper::translate('comment'));
        $sheet->setCellValue('E1', TranslationHelper::translate('date'));
        $sheet->setCellValue('F1', TranslationHelper::translate('status'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['serial_number']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['employee']);
            $sheet->setCellValue('C' . $row, $item['updated_by']);
            $sheet->setCellValue('D' . $row, $item['comment']);
            $sheet->setCellValue('E' . $row, $item['date']);
            $sheet->setCellValue('F' . $row, TranslationHelper::translate($item['status']));
            $row++;
        }

        // Set filename and export
        $filename = 'exported_lending_history' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }

    public function actionRepairLog()
    {
        $searchModel = new RepairLogSearch();
       
        //filter params
        $params = Yii::$app->request->post();

        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['repair-log/detail']);
        }
        //echo var_dump($params);
        //exit();
        // Get the data provider with params applied
        $dataProvider = $searchModel->searchDetail($params);
        $dataProvider->pagination = false; // Disable pagination for export

        $items = $dataProvider->getModels(); // Retrieve data with filters applied
        
        // Fetch data (for example, from a model)
        //$lendingmodel = new Lending();
        //$items = $lendingmodel->getLendingList();  // change it to calling getLendingList in Lending model

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('B1', TranslationHelper::translate('item_name'));
        $sheet->setCellValue('C1', TranslationHelper::translate('type'));
        $sheet->setCellValue('D1', TranslationHelper::translate('datetime'));

        // Populate data
        $row = 2;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['serial_number']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['item_name']);
            $sheet->setCellValue('C' . $row, $item['rep_type']);
            $sheet->setCellValue('D' . $row, $item['datetime']);
            $row++;
        }

        // Set filename and export
        $filename = 'exported_repair_log' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }

    public function actionRepairLogSingle($month, $year)
    {
        $searchModel = new RepairLogSearch();
        
        $searchModel->month = $month; // Set month
        $searchModel->year = $year;   // Set year
        $searchModel->id_rep_t = 1; // repair opened type

        //filter params
        $params = Yii::$app->request->post();

        //repair open
        $dataProvider = $searchModel->searchDetail($params);
       


        // Load parameters directly into the search model to ensure they apply
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            // If params do not load or validate, handle it (e.g., return all data or show an error)
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['repair-log/detail']);
        }


        //echo var_dump($params);
        //exit();
        // Get the data provider with params applied
        $dataProvider = $searchModel->searchDetail($params);
        $dataProvider->pagination = false; // Disable pagination for export

        $items = $dataProvider->getModels(); // Retrieve data with filters applied
        
        //repair closed
        $searchModel->id_rep_t = 2; // repair closed type
        $params = Yii::$app->request->post();
        $closedRepair = $searchModel->searchDetail($params);
        $closedRepair->pagination = false; // Disable pagination for export

        $closeds = $closedRepair->getModels(); // Retrieve data with filters applied
        // Fetch data (for example, from a model)
        //$lendingmodel = new Lending();
        //$items = $lendingmodel->getLendingList();  // change it to calling getLendingList in Lending model

        // Create new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Set headers
        $sheet->setCellValue('A1', TranslationHelper::translate('Repair Initated'));
        $sheet->setCellValue('A2', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('B2', TranslationHelper::translate('item_name'));
        $sheet->setCellValue('C2', TranslationHelper::translate('datetime'));
        $sheet->setCellValue('E1', TranslationHelper::translate('Repair Initated'));
        $sheet->setCellValue('E2', TranslationHelper::translate('serial_number'));
        $sheet->setCellValue('F2', TranslationHelper::translate('item_name'));
        $sheet->setCellValue('G2', TranslationHelper::translate('datetime'));

        // Populate data
        $row = 3;  // Row starts after the headers
        foreach ($items as $item) {
            $sheet->setCellValue('A' . $row, $item['serial_number']);  // Access array keys instead of object properties
            $sheet->setCellValue('B' . $row, $item['item_name']);
            $sheet->setCellValue('C' . $row, $item['datetime']);
            $row++;
        }
        $row = 3;  // Row starts after the headers
        foreach ($closeds as $closed) {
            $sheet->setCellValue('E' . $row, $closed['serial_number']);  // Access array keys instead of object properties
            $sheet->setCellValue('F' . $row, $closed['item_name']);
            $sheet->setCellValue('G' . $row, $closed['datetime']);
            $row++;
        }
        // Set filename and export
        $filename = 'exported_repair_log_monthly' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($spreadsheet);

        // Send file as response for download
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }
}
