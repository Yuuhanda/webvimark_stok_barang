<?php

namespace app\models;

use app\helpers\TranslationHelper;
use yii\base\Model;
use yii\data\ArrayDataProvider;
use yii\db\Query;

class RepairLogSearch extends RepairLog
{
    public $month;
    public $year;

    public $item_name;
    public $serial_number;
    public $id_rep_t;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['month', 'year'], 'integer'],
            [['serial_number', 'item_name', 'datetime', 'rep_type', 'id_rep_t'], 'safe']
        ];
    }

    /**
     * Search method with custom query.
     *
     * @param array $params
     * @return ArrayDataProvider
     */
    public function search($params)
    {
        $query = (new Query())
            ->select([
                'year' => new \yii\db\Expression('YEAR(datetime)'),
                'month' => new \yii\db\Expression('MONTH(datetime)'),
                'rep_type_1_count' => new \yii\db\Expression('COUNT(CASE WHEN rep_type = 1 THEN 1 END)'),
                'rep_type_2_count' => new \yii\db\Expression('COUNT(CASE WHEN rep_type = 2 THEN 1 END)'),
                'total_repairs' => new \yii\db\Expression('COUNT(*)'),
            ])
            ->from('repair_log')
            ->groupBy(['YEAR(datetime)', 'MONTH(datetime)'])
            ->orderBy(['YEAR(datetime)' => SORT_DESC, 'MONTH(datetime)' => SORT_DESC]);

        // Load parameters
        $this->load($params);

        // Filter conditions
        if ($this->validate()) {
            if (!empty($this->year)) {
                $query->andWhere(new \yii\db\Expression('YEAR(datetime) = :year', [':year' => $this->year]));
            }
            if (!empty($this->month)) {
                $query->andWhere(new \yii\db\Expression('MONTH(datetime) = :month', [':month' => $this->month]));
            }
        }

        // Execute query and prepare ArrayDataProvider
        $data = $query->all();

        return new ArrayDataProvider([
            'allModels' => $data,
            'pagination' => [
                'pageSize' => 12,
            ],
        ]);
    }

    public function searchDetail($params)
    {
        // Base query using the provided SQL
        $query = (new Query())
            ->select([
                'item_unit.serial_number AS serial_number',
                'item.item_name AS item_name',
                'rep_type_lookup.rep_type AS rep_type',
                'repair_log.datetime AS datetime',
            ])
            ->from('repair_log')
            ->leftJoin('item_unit', 'repair_log.id_unit = item_unit.id_unit')
            ->leftJoin('item', 'item_unit.id_item = item.id_item')
            ->leftJoin('rep_type_lookup', 'rep_type_lookup.id_rep_t = repair_log.rep_type');
    
        // Load and apply filters from $params
        $this->load($params);
    
        if ($this->validate()) {
            if (!empty($this->year)) {
                $query->andWhere(new \yii\db\Expression('YEAR(datetime) = :year', [':year' => $this->year]));
            }
            if (!empty($this->month)) {
                $query->andWhere(new \yii\db\Expression('MONTH(datetime) = :month', [':month' => $this->month]));
            }
        }
    
        // Add conditions based on filters
        $query->andFilterWhere(['like', 'item_unit.serial_number', $this->serial_number])
        ->andFilterWhere(['like', 'item.item_name', $this->item_name])
        ->andFilterHaving(['like', 'rep_type_lookup.rep_type', $this->rep_type])
        ->andFilterWhere(['rep_type_lookup.id_rep_t' => $this->id_rep_t]);

        if(!empty($this->id_rep_t)){
            $query->orderBy(['item_unit.serial_number' => SORT_DESC]);
        } else{
            $query->orderBy(['repair_log.datetime' => SORT_DESC]);
        }
        $command = $query->createCommand();
        $results = $command->queryAll();

        // Apply TranslationHelper::translate to 'condition'
        foreach ($results as &$result) {
            if (isset($result['rep_type'])) {
                $result['rep_type'] = TranslationHelper::translate($result['rep_type']);
            }
        }
        // Return as ArrayDataProvider
        return new ArrayDataProvider([
            'allModels' => $results,
            'pagination' => [
                'pageSize' => 12,
            ],
        ]);
    }


    
}
