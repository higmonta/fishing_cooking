cookings = %w(フライ 刺身 塩焼き 唐揚げ カルパッチョ 天ぷら 磯辺揚げ なめろう ムニエル 煮付け ソテー 姿焼き ホイル焼き パスタ 汁 炊き込みご飯 チヂミ 茶漬け 鍋 酒蒸し)
fish = %w(アジ マメアジ イカ サバ マハゼ タコ カサゴ タチウオ カワハギ イシモチ メジナ)
handles = %w(背開き+ゼイゴの処理 内臓の処理+ゼイゴの処理 3枚おろし+ゼイゴの処理 3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ 3枚おろし+ゼイゴの処理+骨抜き 背開き+骨の処理 内臓処理 内臓処理+皮を剥ぐ 3枚おろし 内臓処理+ウロコの処理 3枚おろし+ウロコの処理)
aji_cookings = [
    {cooking_name: "フライ", cooking_image: "フライ.jpg", cooking_url: "https://www.kurashiru.com/recipes/02e06b1a-6505-4cd1-a27a-637feae46fdb", handle_pattern: "背開き+ゼイゴの処理", cooking_total_time: 30, rest_fish_time: 5, cooking_time: 3},
    {cooking_name: "刺身", cooking_image: "刺身.jpg", cooking_url: "https://cookingwithdog.com/ja/recipe/aji-sashimi/", handle_pattern: "3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ", cooking_total_time: 0, rest_fish_time: 0, cooking_time: 0},
    {cooking_name: "塩焼き", cooking_image: "塩焼き.jpg", cooking_url: "https://www.kurashiru.com/recipes/c70654e6-d9ba-4f51-a66a-c90c58490925", handle_pattern: "内臓の処理+ゼイゴの処理", cooking_total_time: 30, rest_fish_time: 10, cooking_time: 15},
    {cooking_name: "カルパッチョ", cooking_image: "sample.jpg", cooking_url: "https://www.kurashiru.com/recipes/31a3451e-ce38-4546-80aa-0145e525ba6b", handle_pattern: "3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ", cooking_total_time: 10, rest_fish_time: 0, cooking_time: 0},
    {cooking_name: "天ぷら", cooking_image: "天ぷら.jpg", cooking_url: "https://www.kurashiru.com/recipes/ae0223c6-3342-4e7b-abf8-214d62aaede0", handle_pattern: "背開き+ゼイゴの処理", cooking_total_time: 20, rest_fish_time: 10, cooking_time: 2},
    {cooking_name: "なめろう", cooking_image: "なめろう.jpg", cooking_url: "https://www.kurashiru.com/recipes/f0529d5f-630d-4db5-a76e-9cc996bdd653", handle_pattern: "3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ", cooking_total_time: 15, rest_fish_time: 0, cooking_time: 2},
    {cooking_name: "ムニエル", cooking_image: "ムニエル.jpg", cooking_url: "https://www.kurashiru.com/recipes/b6ac1eba-a1bc-4a03-bbcd-3cc1c412fbcb", handle_pattern: "3枚おろし+ゼイゴの処理+骨の処理", cooking_total_time: 30, rest_fish_time: 0, cooking_time: 4},
    {cooking_name: "煮付け", cooking_image: "sample.jpg", cooking_url: "https://www.kurashiru.com/recipes/83e46755-0f2e-44ea-a322-497bbfcccd39", handle_pattern: "内臓の処理+ゼイゴの処理", cooking_total_time: 20, rest_fish_time: 0, cooking_time: 10},
    {cooking_name: "ソテー", cooking_image: "sample.jpg", cooking_url: "https://www.kurashiru.com/recipes/996aee3a-db4f-4589-b72c-27f8d5210092", handle_pattern: "3枚おろし+ゼイゴの処理 ", cooking_total_time: 20, rest_fish_time: 0, cooking_time: 5},
    {cooking_name: "ホイル焼き", cooking_image: "sample.jpg", cooking_url: "https://recipe.rakuten.co.jp/recipe/1820025562/", handle_pattern: "3枚おろし+ゼイゴの処理", cooking_total_time: 30, rest_fish_time: 10, cooking_time: 12},
    {cooking_name: "炊き込みご飯", cooking_image: "sample.jpg", cooking_url: "https://delishkitchen.tv/recipes/149663037043769763", handle_pattern: "内臓の処理+ゼイゴの処理", cooking_total_time: 60, rest_fish_time: 0, cooking_time: 50},
    {cooking_name: "茶漬け", cooking_image: "sample.jpg", cooking_url: "https://www.kurashiru.com/recipes/f733132a-ab4b-4378-8fb8-db17b7d63709", handle_pattern: "3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ", cooking_total_time: 15, rest_fish_time: 0, cooking_time: 0}
]

mameaji_cookings = [
    {cooking_name: "唐揚げ", cooking_image: "唐揚げ.jpg", cooking_url: "https://www.kurashiru.com/recipes/0b5e9148-f191-42d8-932a-ed40b71549b0", handle_pattern: "内臓の処理+ゼイゴの処理", cooking_total_time: 15, rest_fish_time: 0, cooking_time: 5},
    {cooking_name: "磯揚げ", cooking_image: "sample.jpg", cooking_url: "https://www.kurashiru.com/recipes/960d103c-012a-4185-9497-c6b412d12ba4", handle_pattern: "内臓の処理+ゼイゴの処理", cooking_total_time: 25, rest_fish_time: 15, cooking_time: 5}
]

ika_cookings = [
    {cooking_name: "フライ", cooking_image: "フライ.jpg", cooking_url: "https://www.kurashiru.com/recipes/6c4907e3-7062-4549-a627-3a10cc383e92", handle_pattern: "内臓処理+皮を剥ぐ", cooking_total_time: 20, rest_fish_time: 0, cooking_time: 2},
    {cooking_name: "刺身", cooking_image: "刺身.jpg", cooking_url: "https://www.kurashiru.com/recipes/5365c691-d49f-441d-8258-ddfc2c4f0321", handle_pattern: "内臓処理+皮を剥ぐ", cooking_total_time: 0, rest_fish_time: 0, cooking_time: 0},
    {cooking_name: "カルパッチョ", cooking_image: "sample.jpg", cooking_url: "https://oceans-nadia.com/user/10668/recipe/101305", handle_pattern: "内臓処理+皮を剥ぐ", cooking_total_time: 5, rest_fish_time: 0, cooking_time: 0},
    {cooking_name: "天ぷら", cooking_image: "天ぷら.jpg", cooking_url: "https://www.kurashiru.com/recipes/d1ab9df9-a068-4863-a1e9-2193c8674fd6", handle_pattern: "内臓処理+皮を剥ぐ", cooking_total_time: 30, rest_fish_time: 0, cooking_time: 2},
    {cooking_name: "煮付け", cooking_image: "煮付け.jpg", cooking_url: "https://www.kurashiru.com/recipes/a2baa244-bc89-472f-9639-bdf0705f1077", handle_pattern: "内臓処理", cooking_total_time: 20, rest_fish_time: 0, cooking_time: 15},
    {cooking_name: "ソテー", cooking_image: "sample.jpg", cooking_url: "https://www.kurashiru.com/recipes/372cea8a-0952-4e02-96de-894af709aa45", handle_pattern: "内臓処理", cooking_total_time: 20, rest_fish_time: 0, cooking_time: 3},
    {cooking_name: "姿焼き", cooking_image: "姿焼き.jpg", cooking_url: "https://delishkitchen.tv/recipes/157627457397064083", handle_pattern: "内臓処理", cooking_total_time: 20, rest_fish_time: 10, cooking_time: 8},
    {cooking_name: "ホイル焼き", cooking_image: "ホイル焼き.jpg", cooking_url: "https://www.kurashiru.com/recipes/87f9e48b-db85-4d10-b75a-e54bfd88f32a", handle_pattern: "内臓処理", cooking_total_time: 25, rest_fish_time: 0, cooking_time: 10},
    {cooking_name: "パスタ", cooking_image: "パスタ.jpg", cooking_url: "https://www.kurashiru.com/recipes/5a8987c6-41d1-495f-8e96-2944c84b9b6d", handle_pattern: "内臓処理", cooking_total_time: 30, rest_fish_time: 0, cooking_time: 8},
    {cooking_name: "チヂミ", cooking_image: "チヂミ.jpg", cooking_url: "https://www.kurashiru.com/recipes/41619367-880e-46d0-ae91-739eeb8f3205", handle_pattern: "内臓処理", cooking_total_time: 20, rest_fish_time: 0, cooking_time: 6}
]

saba_cookings = [
    {cooking_name: "塩焼き", cooking_image: "塩焼き.jpg", cooking_url: "https://www.kurashiru.com/recipes/b1282196-e5c8-47d3-ba70-f24a0047d8c8", handle_pattern: "3枚おろし", cooking_total_time: 20, rest_fish_time: 5, cooking_time: 10},
    {cooking_name: "煮付け", cooking_image: "煮付け.jpg", cooking_url: "https://www.kurashiru.com/recipes/fb4ea1a6-6ed9-4fcf-853f-8c89f4b1b2b0", handle_pattern: "3枚おろし", cooking_total_time: 30, rest_fish_time: 0, cooking_time: 15},
    {cooking_name: "ホイル焼き", cooking_image: "ホイル焼き.jpg", cooking_url: "https://www.kurashiru.com/recipes/2e12b281-fe2c-4486-ad85-63f60d0476d7", handle_pattern: "3枚おろし", cooking_total_time: 20, rest_fish_time: 0, cooking_time: 10}
]

mahaze_cookings = [
    {cooking_name: "天ぷら", cooking_image: "天ぷら.jpg", cooking_url: "https://recipe.rakuten.co.jp/recipe/1330018491/", handle_pattern: "背開き+骨の処理", cooking_total_time: 4, rest_fish_time: 0, cooking_time: 2},
    {cooking_name: "唐揚げ", cooking_image: "唐揚げ.jpg", cooking_url: "https://recipe.rakuten.co.jp/recipe/1160033295/", handle_pattern: "内臓処理", cooking_total_time: 7, rest_fish_time: 0, cooking_time: 5}
]

cookings.each do |cooking|
    Cooking.create(name: cooking)
end

fish.each do |fish|
    Fish.create(kind: fish)
end

handles.each do |handle|
    Handle.create(pattern: handle)
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
    aji.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url, handle_id: handle_id, cooking_total_time: cooking_total_time, rest_fish_time: rest_fish_time, cooking_time: cooking_time)
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
    mameaji.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url, handle_id: handle_id, cooking_total_time: cooking_total_time, rest_fish_time: rest_fish_time, cooking_time: cooking_time)
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
    ika.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url, handle_id: handle_id, cooking_total_time: cooking_total_time, rest_fish_time: rest_fish_time, cooking_time: cooking_time)
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
    saba.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url, handle_id: handle_id, cooking_total_time: cooking_total_time, rest_fish_time: rest_fish_time, cooking_time: cooking_time)
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
    mahaze.cooking_informations.create(cooking_id: cooking_id, image: image, cooking_url: cooking_url, handle_id: handle_id, cooking_total_time: cooking_total_time, rest_fish_time: rest_fish_time, cooking_time: cooking_time)
end