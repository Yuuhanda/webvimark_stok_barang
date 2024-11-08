<?php

namespace app\models;

use yii\base\Model;
use yii\data\ArrayDataProvider;
use yii\db\Query;

class LendingSearch extends Model
{
    public $serial_number;
    public $employee;
    public $updated_by;
    public $comment;
    public $date;
    public $id_unit;
    public $id_lending;
    public $SKU;
    public $item_name;
    public $lending_type;
    public $id_item;

    /**
     * Rules for validation (optional)
     */
    public function rules()
    {
        return [
            [['serial_number', 'employee', 'updated_by', 'comment'], 'safe'],
            [['date'], 'date', 'format' => 'php:Y-m-d'],
            [['id_unit', 'id_lending'], 'integer'],
        ];
    }

    /**
     * Search function to apply filters and return data provider
     */
    public function search($params)
    {
        // Your custom query
        $query = (new Query())
            ->select([
                'serial_number' => 'item_unit.serial_number',
                'employee' => 'employee.emp_name',
                'updated_by' => 'user.username',
                'comment' => 'item_unit.comment',
                'date' => 'lending.date',
                'id_unit' => 'lending.id_unit',
                'id_lending' => 'lending.id_lending',
            ])
            ->from('lending')
            ->leftJoin('employee', 'employee.id_employee = lending.id_employee')
            ->leftJoin('item_unit', 'item_unit.id_unit = lending.id_unit')
            ->leftJoin('user', 'user.id = lending.user_id')
            ->where(['lending.type' => 1]);

        // Load the search parameters
        $this->load($params);

        // Apply filtering conditions
        if (!$this->validate()) {
            // Return all records if validation fails
            $query->where('0=1');
        }

        // Add conditions based on filters
        $query->andFilterWhere(['like', 'item_unit.serial_number', $this->serial_number])
              ->andFilterWhere(['like', 'employee.emp_name', $this->employee])
              ->andFilterWhere(['like', 'user.username', $this->updated_by])
              ->andFilterWhere(['like', 'item_unit.comment', $this->comment])
              ->andFilterWhere(['=', 'lending.date', $this->date]);

        // Execute the query and return an ArrayDataProvider
        $command = $query->createCommand();
        $results = $command->queryAll();

        return new ArrayDataProvider([
            'allModels' => $results,
            'pagination' => [
                'pageSize' => 20, // Adjust as needed
            ],
            'sort' => [
                'attributes' => [
                    'serial_number',
                    'employee',
                    'updated_by',
                    'comment',
                    'date',
                ],
            ],
        ]);
    }

    public function searchItemReport($params)
    {
        // Initialize the query for the item report
        $query = (new Query())
            ->select([
                'SKU' => 'item.SKU',
                'item_name' => 'item.item_name',
                'id_item' => 'item.id_item',
                'number_of_times_item_is_lent' => 'COUNT(lending.id_unit)', // Count of units lent out
            ])
            ->from('item_unit')
            ->leftJoin('lending', 'item_unit.id_unit = lending.id_unit')
            ->leftJoin('item', 'item.id_item = item_unit.id_item')
            // Uncomment if you need to filter by lending type
            //->where(['lending.type' => $lending_type])
            ->groupBy('item.id_item');
    
        // Load search parameters (if any)
        $this->load($params);
    
        // If validation fails, return no results
        if (!$this->validate()) {
            $query->where('0=1');
        }
    
        // Apply filtering conditions (search filters)
        $query->andFilterWhere(['like', 'item.item_name', $this->item_name]) // Filter item_name
              ->andFilterWhere(['like', 'item.SKU', $this->SKU])             // Filter SKU
              ->andFilterWhere(['like', 'item.id_item', $this->id_item]);     // Filter id_item
    
        // Execute the query
        $command = $query->createCommand();
        $results = $command->queryAll();
    
        // Return the results wrapped in an ArrayDataProvider
        return new ArrayDataProvider([
            'allModels' => $results,
            'pagination' => [
                'pageSize' => 20, // Adjust pagination size if needed
            ],
            'sort' => [
                'attributes' => [
                    'item_name',
                    'SKU',
                    'id_item',
                    'item_lent',
                ],
            ],
        ]);
    }
    
    
    public function searchUnitReport($params)
    {
        // Initialize the query for the item report
        $query = (new Query())
            ->select([
                'serial_number' => 'item_unit.serial_number',
                'item_name' => 'item.item_name',
                'id_item' => 'item.id_item',
                'id_unit' => 'lending.id_unit',
                'number_of_times_unit_is_lent' => 'COUNT(lending.id_unit)', // Count of units lent out
            ])
            ->from('item_unit')
            ->leftJoin('lending', 'item_unit.id_unit = lending.id_unit')
            ->leftJoin('item', 'item.id_item = item_unit.id_item')
            //->where(['lending.type' => $lending_type]) // Uncomment if you need to filter by lending type
            ->groupBy('lending.id_unit')
            ->having(['>', 'COUNT(lending.id_unit)', 0]); // Show only rows where count > 0
    
        // Load search parameters (if any)
        $this->load($params);
    
        // If validation fails, return no results
        if (!$this->validate()) {
            $query->where('0=1');
        }
    
        // Apply filtering conditions (search filters)
        $query->andFilterWhere(['like', 'item_unit.serial_number', $this->serial_number])
              ->andFilterWhere(['like', 'item.item_name', $this->item_name]) // Corrected to use andFilterWhere
              ->andFilterWhere(['like', 'item.id_item', $this->id_item]);
    
        // Execute the query
        $command = $query->createCommand();
        $results = $command->queryAll();
    
        // Return the results wrapped in an ArrayDataProvider
        return new ArrayDataProvider([
            'allModels' => $results,
            'pagination' => [
                'pageSize' => 20, // Adjust pagination size if needed
            ],
            'sort' => [
                'attributes' => [
                    'item_name',
                    'serial_number',
                    'id_item',
                    'id_unit',
                    'number_of_times_unit_is_lent',
                ],
            ],
        ]);
    }
    
}
