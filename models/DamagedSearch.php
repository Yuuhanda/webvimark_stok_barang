<?php

namespace app\models;

use webvimark\modules\UserManagement\models\User;
use Yii;
use yii\base\Model;
use yii\data\ArrayDataProvider;
use yii\db\Query;

class DamagedSearch extends Model
{
    public $condition;
    public $serial_number;
    public $id_unit;
    public $status;
    public $updated_by;
    public $warehouse;
    public $comment;

    public function rules()
    {
        return [
            [['condition', 'serial_number', 'id_unit', 'status', 'updated_by', 'warehouse', 'comment'], 'safe'],
        ];
    }

    public function search($params)
    {
        $id_wh = Yii::$app->user->identity->id_wh;

        if (User::hasRole('Admin') && !User::hasRole('superadmin')){
            $query = (new Query())
            ->select([
                'condition_lookup.condition_name AS condition',
                'item_unit.serial_number AS serial_number',
                'item_unit.id_unit AS id_unit',
                'status_lookup.status_name AS status',
                'user.username AS updated_by',
                'warehouse.wh_name AS warehouse',
                'item_unit.comment AS comment',
                'item_unit.status AS stats'
            ])
            ->from('item_unit')
            ->leftJoin('lending', 'item_unit.id_unit = lending.id_unit')
            ->leftJoin('warehouse', 'warehouse.id_wh = item_unit.id_wh')
            ->leftJoin('item', 'item.id_item = item_unit.id_item')
            ->leftJoin('user', 'user.id = item_unit.updated_by')
            ->leftJoin('status_lookup', 'item_unit.status = status_lookup.id_status')
            ->leftJoin('condition_lookup', 'item_unit.condition = condition_lookup.id_condition')
            ->where(['!=', 'item_unit.condition', 1])  // Filter for condition != 1
            ->andWhere(['item_unit.id_wh' => $id_wh])
            ->groupBy('item_unit.id_unit');  // Group by id_unit
        } else {
            $query = (new Query())
                ->select([
                    'condition_lookup.condition_name AS condition',
                    'item_unit.serial_number AS serial_number',
                    'item_unit.id_unit AS id_unit',
                    'status_lookup.status_name AS status',
                    'user.username AS updated_by',
                    'warehouse.wh_name AS warehouse',
                    'item_unit.comment AS comment',
                    'item_unit.status AS stats'
                ])
                ->from('item_unit')
                ->leftJoin('lending', 'item_unit.id_unit = lending.id_unit')
                ->leftJoin('warehouse', 'warehouse.id_wh = item_unit.id_wh')
                ->leftJoin('item', 'item.id_item = item_unit.id_item')
                ->leftJoin('user', 'user.id = item_unit.updated_by')
                ->leftJoin('status_lookup', 'item_unit.status = status_lookup.id_status')
                ->leftJoin('condition_lookup', 'item_unit.condition = condition_lookup.id_condition')
                ->where(['!=', 'item_unit.condition', 1])  // Filter for condition != 1
                ->groupBy('item_unit.id_unit');  // Group by id_unit
            }
        // Apply filters from query params
        $this->load($params);

        if (!$this->validate()) {
            // If validation fails, return the query without filters
            return new ArrayDataProvider([
                'allModels' => [],
            ]);
        }

        if ($this->condition) {
            $query->andWhere(['like', 'item_unit.condition', $this->condition]);
        }
        if ($this->serial_number) {
            $query->andWhere(['like', 'item_unit.serial_number', $this->serial_number]);
        }
        if ($this->id_unit) {
            $query->andWhere(['item_unit.id_unit' => $this->id_unit]);
        }
        if ($this->updated_by) {
            $query->andWhere(['like', 'user.username', $this->updated_by]);
        }
        if ($this->comment) {
            $query->andWhere(['like', 'item_unit.comment', $this->comment]);
        }
        if ($this->warehouse) {
            $query->andWhere(['like', 'item_unit.id_wh', $this->warehouse]);
        }
        if ($this->status) {
            $query->andWhere(['like', 'item_unit.status', $this->status]);
        }

        $command = $query->createCommand();
        $results = $command->queryAll();

        return new ArrayDataProvider([
            'allModels' => $results,
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);
    }
    

    public function searchRepair($params)
    {
        $query = (new Query())
            ->select([
                'condition_lookup.condition_name AS condition',
                'item_unit.serial_number AS serial_number',
                'item_unit.id_unit AS id_unit',
                'status_lookup.status_name AS status',
                'user.username AS updated_by',
                'item_unit.comment AS comment',
            ])
            ->from('item_unit')
            ->leftJoin('status_lookup', 'item_unit.status = status_lookup.id_status')
            ->leftJoin('condition_lookup', 'item_unit.condition = condition_lookup.id_condition')
            ->leftJoin('user', 'user.id = item_unit.updated_by')
            ->where(['item_unit.status' => 3])  // Filter for status = 3
            ->groupBy('item_unit.id_unit');
        
        // Apply filters from query params
        $this->load($params);

        if (!$this->validate()) {
            // If validation fails, return the query without filters
            return new ArrayDataProvider([
                'allModels' => [],
            ]);
        }

        if ($this->condition) {
            $query->andWhere(['like', 'condition_lookup.condition_name', $this->condition]);
        }
        if ($this->serial_number) {
            $query->andWhere(['like', 'item_unit.serial_number', $this->serial_number]);
        }
        if ($this->id_unit) {
            $query->andWhere(['item_unit.id_unit' => $this->id_unit]);
        }
        if ($this->updated_by) {
            $query->andWhere(['like', 'user.username', $this->updated_by]);
        }
        if ($this->comment) {
            $query->andWhere(['like', 'item_unit.comment', $this->comment]);
        }

        $command = $query->createCommand();
        $results = $command->queryAll();

        return new ArrayDataProvider([
            'allModels' => $results,
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);
    }
}
