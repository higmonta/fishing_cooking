document.addEventListener('DOMContentLoaded', () => {
    const handlePattern =
      {
        'アジ': ['フライ', '刺身', '塩焼き', 'カルパッチョ', '天ぷら', 'なめろう', 'ムニエル', '煮付け', 'ソテー', 'ホイル焼き', '炊き込みご飯', '茶漬け'],
        'マメアジ': ['唐揚げ', '磯辺揚げ'],
        'イカ': ['フライ', '刺身', 'カルパッチョ', '天ぷら', '煮付け', 'ソテー', '姿焼き', 'ホイル焼き', 'パスタ', 'チヂミ'],
        'サバ': ['塩焼き', '煮付け', 'ホイル焼き'],
        'マハゼ': ['天ぷら', '唐揚げ'],
        'カサゴ': ['唐揚げ', '煮付け', '汁'],
        'タチウオ': ['唐揚げ', '煮付け', '塩焼き', 'ムニエル'],
        'カワハギ': ['唐揚げ', '煮付け'],
        'イシモチ': ['塩焼き', '煮付け', 'ソテー'],
        'メジナ': ['塩焼き', '煮付け', 'ムニエル', 'フライ'],
        '': ['フライ', '刺身', '塩焼き', '唐揚げ', 'カルパッチョ', '天ぷら',
            '磯辺揚げ', 'なめろう', 'ムニエル', '煮付け', 'ソテー', '姿焼き', 
            'ホイル焼き', 'パスタ', '汁', '炊き込みご飯', 'チヂミ', '茶漬け',
            '鍋', '酒蒸し'] // セレクトボックスで魚を選んだ後に初期表示の[魚の種類(必須)]を再度選択した場合に、全料理が表示されるように配列を準備
      };
    
    function setCookingNameOptions(selectedFishValue){
      selectCookingName.innerHTML = '';
      const option_new_default = document.createElement('option');
      option_new_default.innerHTML = '料理の種類(必須)';
      option_new_default.value = '';
      selectCookingName.appendChild(option_new_default);
      handlePattern[selectedFishValue].forEach((menu) => {
        const option_new = document.createElement('option');
        option_new.value = menu;
        option_new.innerHTML = menu;
        selectCookingName.appendChild(option_new);
      });
    }
  
    function setSelectedCooking(selectedCookingValue) {
      selectCookingName.querySelector(`option[value='${selectedCookingValue}']`).setAttribute('selected', 'selected');
    }
    
    const selectFishKind = document.getElementById('fish_kind');
    const selectCookingName = document.getElementById('cooking_name');
  
    
    selectFishKind.addEventListener('change', (e) => {
      setCookingNameOptions(e.target.value);
    })
  
    window.addEventListener('DOMContentLoaded', () => {
      const selectedFishValue = selectFishKind.value;
      const selectedCookingValue = selectCookingName.value;
      setCookingNameOptions(selectedFishValue);
      setSelectedCooking(selectedCookingValue);
    })
  });