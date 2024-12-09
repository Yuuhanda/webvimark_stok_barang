<?php

namespace app\controllers;

use app\helpers\TranslationHelper;
use app\models\WarehouseSearch;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use app\models\Item;
use app\models\ItemUnit;
use app\models\UnitLog;
use Yii;
use app\models\ItemSearch;
use app\models\Warehouse;
use app\models\LogSearch;
use app\models\UnitSearch;
use app\models\LendingSearch;
use app\models\DamagedSearch;
use app\models\RepairLogSearch;
use app\services\ExcelExportService;

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
        $params = Yii::$app->request->post();
    
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['lending/list']);
        }
    
        $dataProvider = $searchModel->search($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        // Define headers and columns mapping
        $headers = [
            'serial_number',
            'employee',
            'updated_by', 
            'comment',
            'date'
        ];
        
        // Map to data keys
        $columns = [
            'serial_number',
            'employee',
            'updated_by',
            'comment', 
            'date'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('lending');
    }
    

    public function actionExportDamaged()
    {
        $params = Yii::$app->request->post();   
        $searchModel = new DamagedSearch();
        
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['unit/damaged']);
        }
    
        $dataProvider = $searchModel->search($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'Unit condition',
            'serial_number',
            'status',
            'warehouse',
            'comment'
        ];
        
        $columns = [
            'translate_condition',
            'serial_number', 
            'translate_status',
            'warehouse',
            'comment'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('damaged_unit');
    }
    

    public function actionExportRepair()
    {
        $searchModel = new DamagedSearch();
        $params = Yii::$app->request->post();
    
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['unit/repair']);
        }
    
        $dataProvider = $searchModel->searchRepair($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'unit condition',
            'serial_number',
            'status',
            'updated_by',
            'comment'
        ];
        
        $columns = [
            'translate_condition',
            'serial_number',
            'translate_status',
            'updated_by',
            'comment'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('unit_inrepair_data');
    }
    

    public function actionExportLog()
    {
        $searchModel = new LogSearch();
        $params = Yii::$app->request->post();
    
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['log/index']);
        }
    
        $dataProvider = $searchModel->search($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'serial_number',
            'content', 
            'log date'
        ];
        
        $columns = [
            'serial_number',
            'translate_content',
            'log_date'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('log_all_data');
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

    public function actionExportMain()
    {
        $searchModel = new ItemSearch();
        $params = Yii::$app->request->post();
    
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['item/index']);
        }
    
        $dataProvider = $searchModel->search($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'item_name',
            'SKU',
            'available in warehouse',
            'in_use',
            'in-repair',
            'unit lost'
        ];
        
        $columns = [
            'item_name',
            'SKU',
            'available',
            'in_use',
            'in_repair',
            'lost'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('master_inventory_data');
    }
    
    public function actionItemDetail($id_item)
    {
        $searchModel = new UnitSearch();
        $params = Yii::$app->request->post();
        
        $dataProvider = $searchModel->search($params, $id_item);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'unit condition',
            'serial_number',
            'id_unit',
            'status',
            'updated_by',
            'warehouse',
            'employee',
            'comment'
        ];
        
        $columns = [
            'translate_condition',
            'serial_number',
            'id_unit',
            'translate_status',
            'updated_by',
            'warehouse',
            'employee',
            'comment'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('master_inventory_data');
    }
    


    public function actionWarehouse($id_wh)
    {
        $model = new Warehouse();
        $items = $model->getExport($id_wh);
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'item_name',
            'SKU',
            'available in warehouse',
            'in_use',
            'unit lost'
        ];
        
        $columns = [
            'item_name',
            'SKU',
            'available',
            'in_use',
            'lost'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('warehouse_data');
    }
    
    
    //item detail in warehouse export
    public function actionWhDist($id_item)
    {
        $model = new ItemUnit();
        $items = $model->getWhDistribution($id_item) ?? [];
    
        $wh_mod = new WarehouseSearch();
        $repairs = $wh_mod->searchInRepair(Yii::$app->request->queryParams, $id_item);
        $repairsData = $repairs->getModels();
        $totalInRepair = array_sum(array_column($repairsData, 'in_repair'));
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'warehouse',
            'available in warehouse',
            'in_use',
            'unit lost'
        ];
        
        $columns = [
            'warehouse',
            'available',
            'in_use',
            'lost'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns);
    
        $row = count($items) + 3;
        $excelService
            ->setCellValue('A' . $row, 'Units In-repair')
            ->setCellValue('A' . ($row + 1), $totalInRepair);
    
        $excelService->download('item_in_warehouses_data');
    }
    
    
    

    public function actionExportItemReport()
    {
        $searchModel = new LendingSearch();
        $params = Yii::$app->request->post();
    
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['lending/item-report-active']);
        }
    
        $dataProvider = $searchModel->searchItemReport($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'item_name',
            'SKU',
            'total_item_lent'
        ];
        
        $columns = [
            'item_name',
            'SKU',
            'total_item_lent'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('loan_item_report');
    }
    
    
    public function actionExportUnitReport()
    {
        $searchModel = new LendingSearch();
        $params = Yii::$app->request->post();
    
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['lending/item-report-active']);
        }
    
        $dataProvider = $searchModel->searchUnitReport($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'item_name',
            'serial_number',
            'number_of_times_unit_is_lent'
        ];
        
        $columns = [
            'item_name',
            'serial_number',
            'number_of_times_unit_is_lent'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('loan_unit_report');
    }
    

    public function actionExportLendingHistory()
    {
        $searchModel = new LendingSearch();
        $params = Yii::$app->request->post();
    
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['lending/lending-history']);
        }
    
        $dataProvider = $searchModel->searchLendingHistory($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'serial_number',
            'employee',
            'updated_by',
            'comment',
            'date',
            'status'
        ];
        
        $columns = [
            'serial_number',
            'employee',
            'updated_by',
            'comment',
            'date',
            'translate_status'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('lending_history');
    }
    

    public function actionRepairLog()
    {
        $searchModel = new RepairLogSearch();
        $params = Yii::$app->request->post();
    
        if (!$searchModel->load($params) || !$searchModel->validate()) {
            Yii::$app->session->setFlash('error', 'Invalid search parameters for export.');
            return $this->redirect(['repair-log/detail']);
        }
    
        $dataProvider = $searchModel->searchDetail($params);
        $dataProvider->pagination = false;
        $items = $dataProvider->getModels();
    
        $excelService = new ExcelExportService($this->username);
        
        $headers = [
            'serial_number',
            'item_name',
            'type',
            'datetime'
        ];
        
        $columns = [
            'serial_number',
            'item_name',
            'rep_type',
            'datetime'
        ];
    
        $excelService
            ->setHeaders($headers)
            ->populateData($items, $columns)
            ->download('repair_log');
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
