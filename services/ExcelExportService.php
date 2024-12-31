<?php

namespace app\services;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use app\helpers\TranslationHelper;

class ExcelExportService
{
    private $spreadsheet;
    private $sheet;
    private $username;

    public function __construct($username) 
    {
        $this->username = $username;
        $this->spreadsheet = new Spreadsheet();
        $this->sheet = $this->spreadsheet->getActiveSheet();
    }

    public function setHeaders(array $headers)
    {
        $column = 'A';
        foreach ($headers as $header) {
            $this->sheet->setCellValue($column . '1', TranslationHelper::translate($header));
            $column++;
        }
        return $this;
    }

    public function populateData(array $items, array $columns)
    {
        $row = 2;
        foreach ($items as $item) {
            $column = 'A';
            foreach ($columns as $key) {
                $value = isset($item[$key]) ? $item[$key] : '';
                if (strpos($key, 'translate_') === 0) {
                    $actualKey = str_replace('translate_', '', $key);
                    $value = TranslationHelper::translate($item[$actualKey]);
                }
                $this->sheet->setCellValue($column . $row, $value);
                $column++;
            }
            $row++;
        }
        return $this;
    }

    public function download($prefix)
    {
        $filename = 'exported_' . $prefix . '_' . $this->username . date('_Y-m-d_H-i-s') . '.xlsx';
        $writer = new Xlsx($this->spreadsheet);

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        $writer->save('php://output');
        exit();
    }

    public function setCellValue($cell, $value)
    {
        $this->sheet->setCellValue($cell, $value);
        return $this;
    }

    // Add this method to ExcelExportService class
    public function autoFitColumns()
    {
        foreach ($this->sheet->getColumnIterator() as $column) {
            $this->sheet->getColumnDimension($column->getColumnIndex())->setAutoSize(true);
        }
        return $this;
    }

}

