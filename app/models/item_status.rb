class ItemStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った汚れ・傷なし' },
    { id: 5, name: 'やや傷、汚れ有り' },
    { id: 6, name: '傷や汚れ有り' },
    { id: 7, name: '全体的に状態悪い' }
  ]

   include ActiveHash::Associations
   has_many :items

  end