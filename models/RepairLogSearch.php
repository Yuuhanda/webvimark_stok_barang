<?php

namespace app\models;

use yii\base\Model;
use yii\data\ArrayDataProvider;
use yii\db\Query;

class RepairLogSearch extends RepairLog
{
    public $month;
    public $year;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['month', 'year'], 'integer'],
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
}
