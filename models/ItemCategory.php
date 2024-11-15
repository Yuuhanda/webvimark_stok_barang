<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "item_category".
 *
 * @property int $id_category
 * @property string $category_name
 * @property string $cat_code
 *
 * @property Item[] $items
 */
class ItemCategory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'item_category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['category_name', 'cat_code'], 'required'],
            [['category_name'], 'string', 'max' => 80],
            [['cat_code'], 'string', 'max' => 2],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_category' => 'Id Category',
            'category_name' => 'Category Name',
            'cat_code' => 'Cat Code',
        ];
    }

    /**
     * Gets query for [[Items]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::class, ['id_category' => 'id_category']);
    }

    public static function getCategoryList()
    {
        return self::find()
            ->select(['id_category', 'category_name', 'cat_code'])
            ->asArray()
            ->all();
    }
    
}
