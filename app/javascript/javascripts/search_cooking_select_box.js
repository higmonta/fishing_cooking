document.addEventListener('DOMContentLoaded', () => {
  const handlePattern =
    {
      'アジ': ['背開き+ゼイゴの処理', '3枚おろし+ゼイゴの処理', '内臓処理+ゼイゴの処理', '3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ', '3枚おろし+ゼイゴの処理+骨の処理'],
      'マメアジ': ['内臓処理+ゼイゴの処理'],
      'イカ': ['内臓処理+皮を剥ぐ', '内臓処理'],
      'サバ': ['3枚おろし'],
      'マハゼ': ['背開き+骨の処理', '内臓処理'],
      'カサゴ': ['内臓処理+ウロコの処理'],
      'タチウオ': ['3枚おろし', '内臓処理'],
      'カワハギ': ['内臓処理+皮を剥ぐ'],
      'イシモチ': ['内臓処理+ウロコの処理'],
      'メジナ': ['内臓処理+ウロコの処理', '3枚おろし+ウロコの処理'],
      'タコ': ['下処理(ぬめりを取るなど)+茹でる'],
      '': ['内臓処理', '内臓処理+ゼイゴの処理', '内臓処理+皮を剥ぐ', '内臓処理+ウロコの処理', '3枚おろし', '3枚おろし+ゼイゴの処理',
          '3枚おろし+ゼイゴの処理+骨の処理', '3枚おろし+ゼイゴの処理+骨の処理+皮を剥ぐ', '3枚おろし+ウロコの処理', '背開き+骨の処理',
          '背開き+ゼイゴの処理', '下処理(ぬめりを取るなど)+茹でる'] // セレクトボックスで魚を選んだ後に初期表示の[魚の種類(必須)]を再度選択した場合に、全捌き方が表示されるように配列を準備
    };
  
  function setHandlePatternOptions(selectedFishValue){
    selectHandlePattern.innerHTML = '';
    const option_new_default = document.createElement('option');
    option_new_default.innerHTML = '捌き方(任意)';
    option_new_default.value = '';
    selectHandlePattern.appendChild(option_new_default);
    handlePattern[selectedFishValue].forEach((menu) => {
      const option_new = document.createElement('option');
      option_new.value = menu;
      option_new.innerHTML = menu;
      selectHandlePattern.appendChild(option_new);
    });
  }

  function setSelectedHandle(selectedHandleValue) {
    selectHandlePattern.querySelector(`option[value='${selectedHandleValue}']`).setAttribute('selected', 'selected');
  }
  
  const selectFishKind = document.getElementById('q_fish_kind_eq');
  const selectHandlePattern = document.getElementById('q_handle_pattern_eq');

  
  selectFishKind.addEventListener('change', (e) => {
    setHandlePatternOptions(e.target.value);
  })

  window.addEventListener('DOMContentLoaded', () => {
    const selectedFishValue = selectFishKind.value;
    const selectedHandleValue = selectHandlePattern.value;
    setHandlePatternOptions(selectedFishValue);
    setSelectedHandle(selectedHandleValue);
  })
});