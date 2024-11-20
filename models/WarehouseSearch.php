<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Warehouse;
use webvimark\modules\UserManagement\models\User;
use Yii;
use yii\data\ArrayDataProvider;
use yii\db\Query;
/**
 * WarehouseSearch represents the model behind the search form of `app\models\Warehouse`.
 */
class WarehouseSearch extends Warehouse
{
    
    public $wh_name;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_wh'], 'integer'],
            [['wh_name', 'wh_address'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Warehouse::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_wh' => $this->id_wh,
        ]);

        $query->andFilterWhere(['like', 'wh_name', $this->wh_name])
            ->andFilterWhere(['like', 'wh_address', $this->wh_address]);

        return $dataProvider;
    }

    public function searchWhDist($params, $id_item)
    {
        $id_wh = Yii::$app->user->identity->id_wh;

        if (User::hasRole('Admin') && !User::hasRole('superadmin')){
                    // Construct the query
            $query = (new Query())
            ->select([
                'warehouse' => 'warehouse.wh_name',
                'available' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "1" THEN 1 END)',
                'in_use' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "2" THEN 1 END)',
                'in_repair' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "3" THEN 1 END)',
                'lost' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "4" THEN 1 END)',
            ])
            ->from('item_unit')
            ->leftJoin('warehouse', 'warehouse.id_wh = item_unit.id_wh')
            ->where(['item_unit.id_item' => $id_item])
            ->andWhere(['IS NOT', 'warehouse.wh_name', null]) // Exclude rows with NULL `wh_name`
            ->andWhere(['!=', 'warehouse.wh_name', '']) // Exclude rows with empty `wh_name`
            ->andWhere(['item_unit.id_wh' => $id_wh])
            ->groupBy('warehouse.id_wh');
        } else {
        // Construct the query
        $query = (new Query())
            ->select([
                'warehouse' => 'warehouse.wh_name',
                'available' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "1" THEN 1 END)',
                'in_use' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "2" THEN 1 END)',
                'in_repair' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "3" THEN 1 END)',
                'lost' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "4" THEN 1 END)',
            ])
            ->from('item_unit')
            ->leftJoin('warehouse', 'warehouse.id_wh = item_unit.id_wh')
            ->where(['item_unit.id_item' => $id_item])
            ->andWhere(['IS NOT', 'warehouse.wh_name', null]) // Exclude rows with NULL `wh_name`
            ->andWhere(['!=', 'warehouse.wh_name', '']) // Exclude rows with empty `wh_name`
            ->groupBy('warehouse.id_wh');
            }
        // Load the search parameters
        $this->load($params);
    
        // Apply filtering conditions
        $query->andFilterWhere(['like', 'warehouse.wh_name', $this->wh_name]);
    
        // Execute the query and fetch the results
        $command = $query->createCommand();
        $results = $command->queryAll();
    
        // Create a data provider to return the data
        return new ArrayDataProvider([
            'allModels' => $results,
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);
    }
    

    public function searchInRepair($params, $id_item)
    {
        // Query only for "In-Repair" units
        $query = (new Query())
            ->select(['in_repair' => 'COUNT(CASE WHEN TRIM(item_unit.status) = "3" THEN 1 END)'])
            ->from('item_unit')
            ->where(['item_unit.id_item' => $id_item]);
    
        // Execute the query
        $command = $query->createCommand();
        $results = $command->queryAll();
    
        // Create a data provider for the "In-Repair" units
        return new ArrayDataProvider([
            'allModels' => $results,
            'pagination' => false, // No pagination for a single summary row
        ]);
    }

}
