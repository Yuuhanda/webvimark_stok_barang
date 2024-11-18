<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rep_type_lookup".
 *
 * @property int $id_rep_t
 * @property string $rep_type
 */
class RepTypeLookup extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'rep_type_lookup';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_rep_t', 'rep_type'], 'required'],
            [['id_rep_t'], 'integer'],
            [['rep_type'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_rep_t' => 'Id Rep T',
            'rep_type' => 'Rep Type',
        ];
    }
}
