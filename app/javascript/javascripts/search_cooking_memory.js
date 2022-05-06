document.addEventListener('DOMContentLoaded', () => {
  const searchStartCookingDate = document.getElementById('q_cooking_date_gteq');
  const searchStopCookingDate = document.getElementById('q_cooking_date_lteq');

  
  searchStartCookingDate.addEventListener('focus', () => {
    searchStartCookingDate.type = 'date';
  })
  
  searchStartCookingDate.addEventListener('blur', () => {
    searchStartCookingDate.type = 'search';
  })

  searchStopCookingDate.addEventListener('focus', () => {
    searchStopCookingDate.type = 'date';
  })

  searchStopCookingDate.addEventListener('blur', () => {
    searchStopCookingDate.type = 'search';
  })
});