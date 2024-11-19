<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\User;

/**
 * UserSearch represents the model behind the search form of `app\models\User`.
 */
class UserSearch extends User
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'status', 'superadmin', 'created_at', 'updated_at', 'id_wh'], 'integer'],
            [['username', 'password_hash', 'registration_ip', 'email', 'id_wh', 'warehouse'], 'safe'],
        ];
    }

    public $warehouse; // Virtual attribute

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
        $query = User::find();

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
            'id' => $this->id,
            'status' => $this->status,
            'superadmin' => $this->superadmin,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'registration_ip', $this->registration_ip])
            ->andFilterWhere(['like', 'email', $this->email]);

        return $dataProvider;
    }

    public function searchAdmins($params)
    {
        $query = User::find()
            ->select([
                'user.id AS id',
                'warehouse.wh_name AS warehouse', // this part not showing up in view correctly it shows not set
                'user.username AS username',
                'user.id_wh AS id_wh',
                'auth_assignment.item_name AS role',
            ])
            ->leftJoin('warehouse', 'warehouse.id_wh = user.id_wh')
            ->leftJoin('auth_assignment', 'user.id = auth_assignment.user_id')
            ->where(['auth_assignment.item_name' => 'Admin']);
    
        // ActiveDataProvider for pagination, sorting, and filtering
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
    
        $this->load($params);
    
        if (!$this->validate()) {
            // If validation fails, return the provider without applying further conditions
            $query->where('0=1');
            return $dataProvider;
        }
    
        // Apply filtering conditions
        $query->andFilterWhere([
            'user.id' => $this->id,
            'user.id_wh' => $this->id_wh,
        ]);
    
        $query->andFilterWhere(['like', 'user.username', $this->username])
        ->andFilterWhere(['like', 'warehouse.id_wh', $this->id_wh]);
    
        return $dataProvider;
    }
    
}
