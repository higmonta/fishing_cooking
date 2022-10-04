cookings = %w[フライ 刺身 塩焼き 唐揚げ カルパッチョ 天ぷら 磯辺揚げ なめろう ムニエル 煮付け ソテー 姿焼き ホイル焼き パスタ 汁
              炊き込みご飯 チヂミ 茶漬け 鍋 酒蒸し]
fishes = %w[アジ マメアジ イカ サバ マハゼ カサゴ タチウオ カワハギ イシモチ メジナ タコ]
handles = %w[内臓処理 内臓処理+ゼイゴの処理 内臓処理+皮を剥ぐ 内臓処理+ウロコの処理 3枚おろし 3枚おろし+ゼイゴの処理
             3枚おろし+ゼイゴの処理+骨の処理 3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ 3枚おろし+ウロコの処理 背開き+骨の処理
             背開き+ゼイゴの処理 下処理(ぬめりを取るなど)+茹でる]
cookwares = %w[フライパン フライヤー 鍋 炊飯器 オーブントースター グリル]

aji_cookings = [
  { cooking_name: 'フライ', cooking_image: 'フライ.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/02e06b1a-6505-4cd1-a27a-637feae46fdb',
    handle_pattern: '背開き+ゼイゴの処理', cooking_total_time: 30, rest_fish_time: 5, cooking_time: 3, cookware_name: 'フライヤー' },
  { cooking_name: '刺身', cooking_image: '刺身.jpg',
    cooking_url: 'https://cookingwithdog.com/ja/recipe/aji-sashimi/',
    handle_pattern: '3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ', cooking_total_time: 0, rest_fish_time: 0, cooking_time: 0 },
  { cooking_name: '塩焼き', cooking_image: '塩焼き.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/c70654e6-d9ba-4f51-a66a-c90c58490925',
    handle_pattern: '内臓処理+ゼイゴの処理', cooking_total_time: 30, rest_fish_time: 10, cooking_time: 15,
    cookware_name: 'フライパン' },
  { cooking_name: 'カルパッチョ', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/31a3451e-ce38-4546-80aa-0145e525ba6b',
    handle_pattern: '3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ', cooking_total_time: 10, rest_fish_time: 0, cooking_time: 0 },
  { cooking_name: '天ぷら', cooking_image: '天ぷら.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/ae0223c6-3342-4e7b-abf8-214d62aaede0',
    handle_pattern: '背開き+ゼイゴの処理', cooking_total_time: 20, rest_fish_time: 10, cooking_time: 2, cookware_name: 'フライヤー' },
  { cooking_name: 'なめろう', cooking_image: 'なめろう.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/f0529d5f-630d-4db5-a76e-9cc996bdd653',
    handle_pattern: '3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ', cooking_total_time: 15, rest_fish_time: 0, cooking_time: 0 },
  { cooking_name: 'ムニエル', cooking_image: 'ムニエル.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/b6ac1eba-a1bc-4a03-bbcd-3cc1c412fbcb',
    handle_pattern: '3枚おろし+ゼイゴの処理+骨の処理', cooking_total_time: 30, rest_fish_time: 0, cooking_time: 4,
    cookware_name: 'フライパン' },
  { cooking_name: '煮付け', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/83e46755-0f2e-44ea-a322-497bbfcccd39',
    handle_pattern: '内臓処理+ゼイゴの処理', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 10, cookware_name: '鍋' },
  { cooking_name: 'ソテー', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/996aee3a-db4f-4589-b72c-27f8d5210092',
    handle_pattern: '3枚おろし+ゼイゴの処理', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 5,
    cookware_name: 'フライパン' },
  { cooking_name: 'ホイル焼き', cooking_image: 'sample.jpg',
    cooking_url: 'https://recipe.rakuten.co.jp/recipe/1820025562/',
    handle_pattern: '3枚おろし+ゼイゴの処理', cooking_total_time: 30, rest_fish_time: 10, cooking_time: 12,
    cookware_name: 'フライパン' },
  { cooking_name: '炊き込みご飯', cooking_image: 'sample.jpg',
    cooking_url: 'https://delishkitchen.tv/recipes/149663037043769763',
    handle_pattern: '内臓処理+ゼイゴの処理', cooking_total_time: 60, rest_fish_time: 0, cooking_time: 50, cookware_name: '炊飯器' },
  { cooking_name: '茶漬け', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/f733132a-ab4b-4378-8fb8-db17b7d63709',
    handle_pattern: '3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ', cooking_total_time: 15, rest_fish_time: 0, cooking_time: 0 }
]

mameaji_cookings = [
  { cooking_name: '唐揚げ', cooking_image: '唐揚げ.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/0b5e9148-f191-42d8-932a-ed40b71549b0',
    handle_pattern: '内臓処理+ゼイゴの処理', cooking_total_time: 15, rest_fish_time: 0, cooking_time: 5, cookware_name: 'フライヤー' },
  { cooking_name: '磯辺揚げ', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/960d103c-012a-4185-9497-c6b412d12ba4',
    handle_pattern: '内臓処理+ゼイゴの処理', cooking_total_time: 25, rest_fish_time: 15, cooking_time: 5, cookware_name: 'フライヤー' }
]

ika_cookings = [
  { cooking_name: 'フライ', cooking_image: 'フライ.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/6c4907e3-7062-4549-a627-3a10cc383e92',
    handle_pattern: '内臓処理+皮を剥ぐ', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 2, cookware_name: 'フライヤー' },
  { cooking_name: '刺身', cooking_image: '刺身.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/5365c691-d49f-441d-8258-ddfc2c4f0321',
    handle_pattern: '内臓処理+皮を剥ぐ', cooking_total_time: 0, rest_fish_time: 0, cooking_time: 0 },
  { cooking_name: 'カルパッチョ', cooking_image: 'sample.jpg',
    cooking_url: 'https://oceans-nadia.com/user/10668/recipe/101305',
    handle_pattern: '内臓処理+皮を剥ぐ', cooking_total_time: 5, rest_fish_time: 0, cooking_time: 0 },
  { cooking_name: '天ぷら', cooking_image: '天ぷら.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/d1ab9df9-a068-4863-a1e9-2193c8674fd6',
    handle_pattern: '内臓処理+皮を剥ぐ', cooking_total_time: 30, rest_fish_time: 0, cooking_time: 2, cookware_name: 'フライヤー' },
  { cooking_name: '煮付け', cooking_image: '煮付け.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/a2baa244-bc89-472f-9639-bdf0705f1077',
    handle_pattern: '内臓処理', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 15, cookware_name: '鍋' },
  { cooking_name: 'ソテー', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/372cea8a-0952-4e02-96de-894af709aa45',
    handle_pattern: '内臓処理', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 3, cookware_name: 'フライパン' },
  { cooking_name: '姿焼き', cooking_image: '姿焼き.jpg',
    cooking_url: 'https://delishkitchen.tv/recipes/157627457397064083',
    handle_pattern: '内臓処理', cooking_total_time: 20, rest_fish_time: 10, cooking_time: 8, cookware_name: 'フライパン' },
  { cooking_name: 'ホイル焼き', cooking_image: 'ホイル焼き.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/87f9e48b-db85-4d10-b75a-e54bfd88f32a',
    handle_pattern: '内臓処理', cooking_total_time: 25, rest_fish_time: 0, cooking_time: 10, cookware_name: 'オーブントースター' },
  { cooking_name: 'パスタ', cooking_image: 'パスタ.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/5a8987c6-41d1-495f-8e96-2944c84b9b6d',
    handle_pattern: '内臓処理', cooking_total_time: 30, rest_fish_time: 0, cooking_time: 8, cookware_name: 'フライパン' },
  { cooking_name: 'チヂミ', cooking_image: 'チヂミ.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/41619367-880e-46d0-ae91-739eeb8f3205',
    handle_pattern: '内臓処理', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 6, cookware_name: 'フライパン' }
]

saba_cookings = [
  { cooking_name: '塩焼き', cooking_image: '塩焼き.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/b1282196-e5c8-47d3-ba70-f24a0047d8c8',
    handle_pattern: '3枚おろし', cooking_total_time: 20, rest_fish_time: 5, cooking_time: 10, cookware_name: 'オーブントースター' },
  { cooking_name: '煮付け', cooking_image: '煮付け.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/fb4ea1a6-6ed9-4fcf-853f-8c89f4b1b2b0',
    handle_pattern: '3枚おろし', cooking_total_time: 30, rest_fish_time: 0, cooking_time: 15, cookware_name: '鍋' },
  { cooking_name: 'ホイル焼き', cooking_image: 'ホイル焼き.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/2e12b281-fe2c-4486-ad85-63f60d0476d7',
    handle_pattern: '3枚おろし', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 10, cookware_name: 'オーブントースター' }
]

mahaze_cookings = [
  { cooking_name: '天ぷら', cooking_image: '天ぷら.jpg',
    cooking_url: 'https://recipe.rakuten.co.jp/recipe/1330018491/', handle_pattern: '背開き+骨の処理',
    cooking_total_time: 4, rest_fish_time: 0, cooking_time: 2, cookware_name: 'フライヤー' },
  { cooking_name: '唐揚げ', cooking_image: '唐揚げ.jpg',
    cooking_url: 'https://recipe.rakuten.co.jp/recipe/1160033295/',
    handle_pattern: '内臓処理', cooking_total_time: 7, rest_fish_time: 0, cooking_time: 5, cookware_name: 'フライヤー' }
]

kasago_cookings = [
  { cooking_name: '唐揚げ', cooking_image: '唐揚げ.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/308a73f5-41d6-4ca6-9aa7-dcb73dc75261',
    handle_pattern: '内臓処理+ウロコの処理', cooking_total_time: 30, rest_fish_time: 10, cooking_time: 5,
    cookware_name: 'フライヤー' },
  { cooking_name: '煮付け', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/5676092a-3ef2-4700-a90a-e8631344a1d8',
    handle_pattern: '内臓処理+ウロコの処理', cooking_total_time: 30, rest_fish_time: 0, cooking_time: 7, cookware_name: 'フライパン' },
  { cooking_name: '汁', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.jinta-express.com/entry/kasagomisosiru',
    handle_pattern: '内臓処理+ウロコの処理', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 15, cookware_name: '鍋' }
]

tachiuo_cookings = [
  { cooking_name: '唐揚げ', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/80e6ef31-4b18-4b7b-a424-57826b118cad',
    handle_pattern: '3枚おろし', cooking_total_time: 40, rest_fish_time: 15, cooking_time: 3, cookware_name: 'フライヤー' },
  { cooking_name: '煮付け', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/023f9c5f-97a9-41be-9e24-298f13260f64',
    handle_pattern: '内臓処理', cooking_total_time: 40, rest_fish_time: 0, cooking_time: 20, cookware_name: '鍋' },
  { cooking_name: '塩焼き', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/3698861e-557d-4f9b-9d25-9d1aafc930f4',
    handle_pattern: '内臓処理', cooking_total_time: 30, rest_fish_time: 15, cooking_time: 10, cookware_name: 'オーブントースター' },
  { cooking_name: 'ムニエル', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/89393bee-66dc-4db0-bbe2-c7938f325f04',
    handle_pattern: '内臓処理', cooking_total_time: 20, rest_fish_time: 5, cooking_time: 10, cookware_name: 'フライパン' }
]

kawahagi_cookings = [
  { cooking_name: '唐揚げ', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/d2f9ccf2-1d18-41b1-8273-3ba5b9c05d36',
    handle_pattern: '内臓処理+皮を剥ぐ', cooking_total_time: 40, rest_fish_time: 0, cooking_time: 5, cookware_name: 'フライヤー' },
  { cooking_name: '煮付け', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/e86a592a-c639-4653-9933-b979cf522649',
    handle_pattern: '内臓処理+皮を剥ぐ', cooking_total_time: 30, rest_fish_time: 0, cooking_time: 11, cookware_name: '鍋' }
]

ishimochi_cookings = [
  { cooking_name: '塩焼き', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/7eb416fa-ca8c-4fd1-ae7d-4a7b02d093df',
    handle_pattern: '内臓処理+ウロコの処理', cooking_total_time: 30, rest_fish_time: 10, cooking_time: 15,
    cookware_name: 'オーブントースター' },
  { cooking_name: '煮付け', cooking_image: 'sample.jpg',
    cooking_url: 'https://www.kurashiru.com/recipes/e5c44c5b-c3a3-40ac-931f-e2a2cfc22a03',
    handle_pattern: '内臓処理+ウロコの処理', cooking_total_time: 30, rest_fish_time: 0, cooking_time: 11, cookware_name: '鍋' },
  { cooking_name: 'ソテー', cooking_image: 'sample.jpg', cooking_url: 'https://recipe.rakuten.co.jp/recipe/1440000846/',
    handle_pattern: '内臓処理+ウロコの処理', cooking_total_time: 15, rest_fish_time: 0, cooking_time: 10, cookware_name: 'フライパン' }
]

mejina_cookings = [
  { cooking_name: '塩焼き', cooking_image: 'sample.jpg', cooking_url: 'https://recipe.rakuten.co.jp/recipe/1570026079/',
    handle_pattern: '内臓処理+ウロコの処理', cooking_total_time: 10, rest_fish_time: 0, cooking_time: 10, cookware_name: 'グリル' },
  { cooking_name: '煮付け', cooking_image: 'sample.jpg', cooking_url: 'https://cookpad.com/recipe/4138440',
    handle_pattern: '内臓処理+ウロコの処理', cooking_total_time: 25, rest_fish_time: 0, cooking_time: 25, cookware_name: '鍋' },
  { cooking_name: 'ムニエル', cooking_image: 'sample.jpg', cooking_url: 'https://cookpad.com/recipe/293169',
    handle_pattern: '3枚おろし+ウロコの処理', cooking_total_time: 15, rest_fish_time: 10, cooking_time: 5,
    cookware_name: 'フライパン' },
  { cooking_name: 'フライ', cooking_image: 'sample.jpg', cooking_url: 'https://recipe.rakuten.co.jp/recipe/1770028723/',
    handle_pattern: '3枚おろし+ウロコの処理', cooking_total_time: 5, rest_fish_time: 0, cooking_time: 1, cookware_name: 'フライヤー' }
]

tako_cookings = [
  { cooking_name: '刺身', cooking_image: '刺身.jpg', cooking_url: 'https://delishkitchen.tv/recipes/380127811270083664',
    handle_pattern: '下処理(ぬめりを取るなど)+茹でる', cooking_total_time: 0, rest_fish_time: 0, cooking_time: 0 },
  { cooking_name: '唐揚げ', cooking_image: '唐揚げ.jpg', cooking_url: 'https://www.kurashiru.com/recipes/6aa51ad7-f05f-4ccb-8d50-dd0176dc977a',
    handle_pattern: '下処理(ぬめりを取るなど)+茹でる', cooking_total_time: 30, rest_fish_time: 15, cooking_time: 3,
    cookware_name: 'フライヤー' },
  { cooking_name: 'カルパッチョ', cooking_image: 'カルパッチョ.jpg', cooking_url: 'https://www.sirogohan.com/recipe/takokarupa/',
    handle_pattern: '下処理(ぬめりを取るなど)+茹でる', cooking_total_time: 10, rest_fish_time: 0, cooking_time: 0 },
  { cooking_name: '磯辺揚げ', cooking_image: '磯辺揚げ.jpg', cooking_url: 'https://www.kurashiru.com/recipes/47d4301d-a088-430a-ba83-05d3436f6f1b',
    handle_pattern: '下処理(ぬめりを取るなど)+茹でる', cooking_total_time: 80, rest_fish_time: 60, cooking_time: 3,
    cookware_name: 'フライヤー' },
  { cooking_name: '煮付け', cooking_image: '煮付け.jpg', cooking_url: 'https://cookpad.com/recipe/2232854',
    handle_pattern: '下処理(ぬめりを取るなど)+茹でる', cooking_total_time: 40, rest_fish_time: 0, cooking_time: 30,
    cookware_name: '鍋' },
  { cooking_name: 'ソテー', cooking_image: 'ソテー.jpg', cooking_url: 'https://www.kurashiru.com/recipes/b00137d1-d3f7-4da2-871a-b431c65968ed',
    handle_pattern: '下処理(ぬめりを取るなど)+茹でる', cooking_total_time: 20, rest_fish_time: 0, cooking_time: 2,
    cookware_name: 'フライパン' },
  { cooking_name: '炊き込みご飯', cooking_image: '炊き込みご飯.jpg', cooking_url: 'https://www.kurashiru.com/recipes/781bca7b-8c5c-4c97-a775-29f006b9eb99',
    handle_pattern: '下処理(ぬめりを取るなど)+茹でる', cooking_total_time: 50, rest_fish_time: 0, cooking_time: 40,
    cookware_name: '炊飯器' }
]

aji_handles = [
  { handle_pattern: '背開き+ゼイゴの処理', handle_time: 7, handle_url: 'https://www.youtube.com/embed/SCiRzd_4qoQ' },
  { handle_pattern: '3枚おろし+ゼイゴの処理', handle_time: 7, handle_url: 'https://www.youtube.com/embed/SCiRzd_4qoQ' },
  { handle_pattern: '内臓処理+ゼイゴの処理', handle_time: 5, handle_url: 'https://www.youtube.com/embed/prHbV0eslxE' },
  { handle_pattern: '3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ', handle_time: 13,
    handle_url: 'https://www.youtube.com/embed/YukRUVPenjc' },
  { handle_pattern: '3枚おろし+ゼイゴの処理+骨の処理', handle_time: 12, handle_url: 'https://www.youtube.com/embed/YukRUVPenjc' }
]

mameaji_handles = [
  { handle_pattern: '内臓処理+ゼイゴの処理', handle_time: 2, handle_url: 'https://www.youtube.com/embed/wlRXU7jW3wI' }
]

ika_handles = [
  { handle_pattern: '内臓処理+皮を剥ぐ', handle_time: 2, handle_url: 'https://www.youtube.com/embed/s1ACMcA1l14' },
  { handle_pattern: '内臓処理', handle_time: 1, handle_url: 'https://www.youtube.com/embed/s1ACMcA1l14' }
]

saba_handles = [
  { handle_pattern: '3枚おろし', handle_time: 3, handle_url: 'https://www.youtube.com/embed/DccAtDzJXVY' }
]

mahaze_handles = [
  { handle_pattern: '背開き+骨の処理', handle_time: 5, handle_url: 'https://www.youtube.com/embed/k55yiTa7Sxw' },
  { handle_pattern: '内臓処理', handle_time: 2, handle_url: 'https://www.youtube.com/embed/YZc4FpXUxV8' }
]

kasago_handles = [
  { handle_pattern: '内臓処理+ウロコの処理', handle_time: 4, handle_url: 'https://www.youtube.com/embed/gQUM8slRDyo' }
]

tachiuo_handles = [
  { handle_pattern: '3枚おろし', handle_time: 5, handle_url: 'https://www.youtube.com/embed/-V1Djq7Bys0' },
  { handle_pattern: '内臓処理', handle_time: 4, handle_url: 'https://www.youtube.com/embed/BxZs9RwAVk0' }
]

kawahagi_handles = [
  { handle_pattern: '内臓処理+皮を剥ぐ', handle_time: 3, handle_url: 'https://www.youtube.com/embed/ZzKBqbkTAsU' }
]

ishimochi_handles = [
  { handle_pattern: '内臓処理+ウロコの処理', handle_time: 4, handle_url: 'https://www.youtube.com/embed/zaIoGFZUqOw' }
]

mejina_handles = [
  { handle_pattern: '内臓処理+ウロコの処理', handle_time: 6, handle_url: 'https://www.youtube.com/embed/m3XAxhlTpYw' },
  { handle_pattern: '3枚おろし+ウロコの処理', handle_time: 10, handle_url: 'https://www.youtube.com/embed/57G0Rdklml0' }
]

tako_handles = [
  { handle_pattern: '下処理(ぬめりを取るなど)+茹でる', handle_time: 15, handle_url: 'https://www.youtube.com/embed/dZ4Z8fsjkek' }
]

cookings.each do |cooking|
  Cooking.create(name: cooking)
end

fishes.each do |fish|
  Fish.create(kind: fish)
end

handles.each do |handle|
  Handle.create(pattern: handle)
end

cookwares.each do |cookware|
  Cookware.create(name: cookware)
end

aji = Fish.find_by(kind: 'アジ')
aji_cookings.each do |aji_cooking|
  cooking_id = Cooking.find_by(name: aji_cooking[:cooking_name]).id
  image = "cooking/aji/#{aji_cooking[:cooking_image]}"
  cooking_url = aji_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: aji_cooking[:handle_pattern]).id
  cooking_total_time = aji_cooking[:cooking_total_time]
  rest_fish_time = aji_cooking[:rest_fish_time]
  cooking_time = aji_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: aji_cooking[:cookware_name])&.id
  aji.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                  handle_id: handle_id, cooking_total_time: cooking_total_time,
                                  rest_fish_time: rest_fish_time, cooking_time: cooking_time, cookware_id: cookware_id)
end
aji_handles.each do |aji_handle|
  handle_id = Handle.find_by(pattern: aji_handle[:handle_pattern]).id
  handle_time = aji_handle[:handle_time]
  handle_url = aji_handle[:handle_url]
  aji.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

mameaji = Fish.find_by(kind: 'マメアジ')
mameaji_cookings.each do |mameaji_cooking|
  cooking_id = Cooking.find_by(name: mameaji_cooking[:cooking_name]).id
  image = "cooking/mameaji/#{mameaji_cooking[:cooking_image]}"
  cooking_url = mameaji_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: mameaji_cooking[:handle_pattern]).id
  cooking_total_time = mameaji_cooking[:cooking_total_time]
  rest_fish_time = mameaji_cooking[:rest_fish_time]
  cooking_time = mameaji_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: mameaji_cooking[:cookware_name])&.id
  mameaji.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                      handle_id: handle_id, cooking_total_time: cooking_total_time,
                                      rest_fish_time: rest_fish_time, cooking_time: cooking_time,
                                      cookware_id: cookware_id)
end
mameaji_handles.each do |mameaji_handle|
  handle_id = Handle.find_by(pattern: mameaji_handle[:handle_pattern]).id
  handle_time = mameaji_handle[:handle_time]
  handle_url = mameaji_handle[:handle_url]
  mameaji.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

ika = Fish.find_by(kind: 'イカ')
ika_cookings.each do |ika_cooking|
  cooking_id = Cooking.find_by(name: ika_cooking[:cooking_name]).id
  image = "cooking/ika/#{ika_cooking[:cooking_image]}"
  cooking_url = ika_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: ika_cooking[:handle_pattern]).id
  cooking_total_time = ika_cooking[:cooking_total_time]
  rest_fish_time = ika_cooking[:rest_fish_time]
  cooking_time = ika_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: ika_cooking[:cookware_name])&.id
  ika.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                  handle_id: handle_id, cooking_total_time: cooking_total_time,
                                  rest_fish_time: rest_fish_time, cooking_time: cooking_time, cookware_id: cookware_id)
end
ika_handles.each do |ika_handle|
  handle_id = Handle.find_by(pattern: ika_handle[:handle_pattern]).id
  handle_time = ika_handle[:handle_time]
  handle_url = ika_handle[:handle_url]
  ika.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

saba = Fish.find_by(kind: 'サバ')
saba_cookings.each do |saba_cooking|
  cooking_id = Cooking.find_by(name: saba_cooking[:cooking_name]).id
  image = "cooking/saba/#{saba_cooking[:cooking_image]}"
  cooking_url = saba_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: saba_cooking[:handle_pattern]).id
  cooking_total_time = saba_cooking[:cooking_total_time]
  rest_fish_time = saba_cooking[:rest_fish_time]
  cooking_time = saba_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: saba_cooking[:cookware_name])&.id
  saba.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                   handle_id: handle_id, cooking_total_time: cooking_total_time,
                                   rest_fish_time: rest_fish_time, cooking_time: cooking_time, cookware_id: cookware_id)
end
saba_handles.each do |saba_handle|
  handle_id = Handle.find_by(pattern: saba_handle[:handle_pattern]).id
  handle_time = saba_handle[:handle_time]
  handle_url = saba_handle[:handle_url]
  saba.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

mahaze = Fish.find_by(kind: 'マハゼ')
mahaze_cookings.each do |mahaze_cooking|
  cooking_id = Cooking.find_by(name: mahaze_cooking[:cooking_name]).id
  image = "cooking/mahaze/#{mahaze_cooking[:cooking_image]}"
  cooking_url = mahaze_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: mahaze_cooking[:handle_pattern]).id
  cooking_total_time = mahaze_cooking[:cooking_total_time]
  rest_fish_time = mahaze_cooking[:rest_fish_time]
  cooking_time = mahaze_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: mahaze_cooking[:cookware_name])&.id
  mahaze.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                     handle_id: handle_id, cooking_total_time: cooking_total_time,
                                     rest_fish_time: rest_fish_time, cooking_time: cooking_time,
                                     cookware_id: cookware_id)
end
mahaze_handles.each do |mahaze_handle|
  handle_id = Handle.find_by(pattern: mahaze_handle[:handle_pattern]).id
  handle_time = mahaze_handle[:handle_time]
  handle_url = mahaze_handle[:handle_url]
  mahaze.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

kasago = Fish.find_by(kind: 'カサゴ')
kasago_cookings.each do |kasago_cooking|
  cooking_id = Cooking.find_by(name: kasago_cooking[:cooking_name]).id
  image = "cooking/kasago/#{kasago_cooking[:cooking_image]}"
  cooking_url = kasago_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: kasago_cooking[:handle_pattern]).id
  cooking_total_time = kasago_cooking[:cooking_total_time]
  rest_fish_time = kasago_cooking[:rest_fish_time]
  cooking_time = kasago_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: kasago_cooking[:cookware_name])&.id
  kasago.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                     handle_id: handle_id, cooking_total_time: cooking_total_time,
                                     rest_fish_time: rest_fish_time, cooking_time: cooking_time,
                                     cookware_id: cookware_id)
end
kasago_handles.each do |kasago_handle|
  handle_id = Handle.find_by(pattern: kasago_handle[:handle_pattern]).id
  handle_time = kasago_handle[:handle_time]
  handle_url = kasago_handle[:handle_url]
  kasago.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

tachiuo = Fish.find_by(kind: 'タチウオ')
tachiuo_cookings.each do |tachiuo_cooking|
  cooking_id = Cooking.find_by(name: tachiuo_cooking[:cooking_name]).id
  image = "cooking/tachiuo/#{tachiuo_cooking[:cooking_image]}"
  cooking_url = tachiuo_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: tachiuo_cooking[:handle_pattern]).id
  cooking_total_time = tachiuo_cooking[:cooking_total_time]
  rest_fish_time = tachiuo_cooking[:rest_fish_time]
  cooking_time = tachiuo_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: tachiuo_cooking[:cookware_name])&.id
  tachiuo.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                      handle_id: handle_id, cooking_total_time: cooking_total_time,
                                      rest_fish_time: rest_fish_time, cooking_time: cooking_time,
                                      cookware_id: cookware_id)
end
tachiuo_handles.each do |tachiuo_handle|
  handle_id = Handle.find_by(pattern: tachiuo_handle[:handle_pattern]).id
  handle_time = tachiuo_handle[:handle_time]
  handle_url = tachiuo_handle[:handle_url]
  tachiuo.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

kawahagi = Fish.find_by(kind: 'カワハギ')
kawahagi_cookings.each do |kawahagi_cooking|
  cooking_id = Cooking.find_by(name: kawahagi_cooking[:cooking_name]).id
  image = "cooking/kawahagi/#{kawahagi_cooking[:cooking_image]}"
  cooking_url = kawahagi_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: kawahagi_cooking[:handle_pattern]).id
  cooking_total_time = kawahagi_cooking[:cooking_total_time]
  rest_fish_time = kawahagi_cooking[:rest_fish_time]
  cooking_time = kawahagi_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: kawahagi_cooking[:cookware_name])&.id
  kawahagi.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                       handle_id: handle_id, cooking_total_time: cooking_total_time,
                                       rest_fish_time: rest_fish_time, cooking_time: cooking_time,
                                       cookware_id: cookware_id)
end
kawahagi_handles.each do |kawahagi_handle|
  handle_id = Handle.find_by(pattern: kawahagi_handle[:handle_pattern]).id
  handle_time = kawahagi_handle[:handle_time]
  handle_url = kawahagi_handle[:handle_url]
  kawahagi.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

ishimochi = Fish.find_by(kind: 'イシモチ')
ishimochi_cookings.each do |ishimochi_cooking|
  cooking_id = Cooking.find_by(name: ishimochi_cooking[:cooking_name]).id
  image = "cooking/ishimochi/#{ishimochi_cooking[:cooking_image]}"
  cooking_url = ishimochi_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: ishimochi_cooking[:handle_pattern]).id
  cooking_total_time = ishimochi_cooking[:cooking_total_time]
  rest_fish_time = ishimochi_cooking[:rest_fish_time]
  cooking_time = ishimochi_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: ishimochi_cooking[:cookware_name])&.id
  ishimochi.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                        handle_id: handle_id, cooking_total_time: cooking_total_time,
                                        rest_fish_time: rest_fish_time, cooking_time: cooking_time,
                                        cookware_id: cookware_id)
end
ishimochi_handles.each do |ishimochi_handle|
  handle_id = Handle.find_by(pattern: ishimochi_handle[:handle_pattern]).id
  handle_time = ishimochi_handle[:handle_time]
  handle_url = ishimochi_handle[:handle_url]
  ishimochi.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

mejina = Fish.find_by(kind: 'メジナ')
mejina_cookings.each do |mejina_cooking|
  cooking_id = Cooking.find_by(name: mejina_cooking[:cooking_name]).id
  image = "cooking/mejina/#{mejina_cooking[:cooking_image]}"
  cooking_url = mejina_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: mejina_cooking[:handle_pattern]).id
  cooking_total_time = mejina_cooking[:cooking_total_time]
  rest_fish_time = mejina_cooking[:rest_fish_time]
  cooking_time = mejina_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: mejina_cooking[:cookware_name])&.id
  mejina.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                     handle_id: handle_id, cooking_total_time: cooking_total_time,
                                     rest_fish_time: rest_fish_time, cooking_time: cooking_time,
                                     cookware_id: cookware_id)
end
mejina_handles.each do |mejina_handle|
  handle_id = Handle.find_by(pattern: mejina_handle[:handle_pattern]).id
  handle_time = mejina_handle[:handle_time]
  handle_url = mejina_handle[:handle_url]
  mejina.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

tako = Fish.find_by(kind: 'タコ')
tako_cookings.each do |tako_cooking|
  cooking_id = Cooking.find_by(name: tako_cooking[:cooking_name]).id
  image = "cooking/tako/#{tako_cooking[:cooking_image]}"
  cooking_url = tako_cooking[:cooking_url]
  handle_id = Handle.find_by(pattern: tako_cooking[:handle_pattern]).id
  cooking_total_time = tako_cooking[:cooking_total_time]
  rest_fish_time = tako_cooking[:rest_fish_time]
  cooking_time = tako_cooking[:cooking_time]
  cookware_id = Cookware.find_by(name: tako_cooking[:cookware_name])&.id
  tako.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url,
                                   handle_id: handle_id, cooking_total_time: cooking_total_time,
                                   rest_fish_time: rest_fish_time, cooking_time: cooking_time,
                                   cookware_id: cookware_id)
end
tako_handles.each do |tako_handle|
  handle_id = Handle.find_by(pattern: tako_handle[:handle_pattern]).id
  handle_time = tako_handle[:handle_time]
  handle_url = tako_handle[:handle_url]
  tako.fish_handle_informations.create(handle_id: handle_id, handle_time: handle_time, handle_url: handle_url)
end

# 初期のテストユーザー
User.create(name: 'テストユーザー', email: 'fishing.cook634@gmail.com', password: '123456789test', password_confirmation: '123456789test')
