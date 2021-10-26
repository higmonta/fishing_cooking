cookings = %w(フライ 刺身 塩焼き 唐揚げ カルパッチョ 天ぷら 磯辺揚げ なめろう ムニエル 煮付け ソテー 姿焼き ホイル焼き パスタ 汁 炊き込みご飯 チヂミ 茶漬け 鍋 酒蒸し)
fish = %w(アジ マメアジ イカ サバ マハゼ タコ カサゴ タチウオ カワハギ イシモチ メジナ)
handles = %w(背開き 3枚おろし 下処理(内臓処理など))



cookings.each do |cooking|
    Cooking.create(name: cooking)
end

fish.each do |fish|
    Fish.create(kind: fish)
end

handles.each do |handle|
    Handle.create(pattern: handle)
end
