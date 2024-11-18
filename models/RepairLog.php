<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "repair_log".
 *
 * @property int $id_repair
 * @property int $id_unit
 * @property string $comment
 * @property int $rep_type
 * @property string $datetime
 *
 * @property ItemUnit $unit
 */
class RepairLog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'repair_log';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_unit', 'comment', 'rep_type', 'datetime'], 'required'],
            [['id_unit', 'rep_type'], 'integer'],
            [['datetime'], 'safe'],
            [['comment'], 'string', 'max' => 120],
            [['id_unit'], 'exist', 'skipOnError' => true, 'targetClass' => ItemUnit::class, 'targetAttribute' => ['id_unit' => 'id_unit']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_repair' => 'Id Repair',
            'id_unit' => 'Id Unit',
            'comment' => 'Comment',
            'rep_type' => 'Rep Type',
            'datetime' => 'Datetime',
        ];
    }

    /**
     * Gets query for [[Unit]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUnit()
    {
        return $this->hasOne(ItemUnit::class, ['id_unit' => 'id_unit']);
    }
}
