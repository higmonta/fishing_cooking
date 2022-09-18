class CalculateCookingTime
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :fish_kind, :string
  attribute :cooking_name, :string
  attribute :let_foodstuff_capacity, :float
  attribute :cookware_capacity, :float
  attribute :count, :integer

  def calculate_handle_total_time
    cooking_id = Cooking.find_by(name: cooking_name).id
    fish_id = Fish.find_by(kind: fish_kind).id
    handle_id = CookingInformation.find_by(cooking_id: cooking_id, fish_id: fish_id).handle_id
    FishHandleInformation.find_by(fish_id: fish_id, handle_id: handle_id).handle_time * count
  end

  def calculate_cooking_total_time
    cooking_id = Cooking.find_by(name: cooking_name).id
    fish_id = Fish.find_by(kind: fish_kind).id
    cooking_information = CookingInformation.find_by(cooking_id: cooking_id, fish_id: fish_id)
    cooking_total_time = cooking_information.cooking_total_time  # cooking_total_time:魚を捌いてある状態から料理して何分で完成するか(T=t1+t2)
    rest_fish_time = cooking_information.rest_fish_time          # rest_fish_time:料理する際に魚を何分寝かせるか
    cooking_time = cooking_information.cooking_time              # cooking_time:魚を何分焼いたり揚げたりするか
    if !rest_fish_time.zero? && !cooking_time.zero? && rest_fish_time <= cooking_time &&
       cookware_capacity <= let_foodstuff_capacity
      ((count / cookware_capacity).ceil - 1) * cooking_time + cooking_total_time
    elsif !rest_fish_time.zero? && !cooking_time.zero? && rest_fish_time <= cooking_time &&
          cookware_capacity > let_foodstuff_capacity
      ((count / let_foodstuff_capacity).ceil - 1) * cooking_time + cooking_total_time
    elsif !rest_fish_time.zero? && !cooking_time.zero? && rest_fish_time > cooking_time &&
          cookware_capacity < let_foodstuff_capacity
      if count <= let_foodstuff_capacity
        ((count / cookware_capacity).ceil - 1) * cooking_time + cooking_total_time
      elsif (let_foodstuff_capacity / cookware_capacity).ceil * cooking_time >= rest_fish_time
        ((let_foodstuff_capacity / cookware_capacity).ceil - 1) * cooking_time + cooking_total_time
      else
        ((let_foodstuff_capacity / cookware_capacity).ceil - 1) * cooking_time + cooking_total_time + ((count -
        let_foodstuff_capacity) / let_foodstuff_capacity).ceil * rest_fish_time
      end
    elsif !rest_fish_time.zero? && !cooking_time.zero? && rest_fish_time > cooking_time &&
          cookware_capacity >= let_foodstuff_capacity
      ((count / let_foodstuff_capacity).ceil - 1) * rest_fish_time + cooking_total_time
    elsif rest_fish_time.zero? && cooking_time.zero?
      0
    elsif rest_fish_time.zero? && !cooking_time.zero?
      ((count / cookware_capacity).ceil - 1) * cooking_time + cooking_total_time
    elsif !rest_fish_time.zero? && cooking_time.zero?
      ((count / let_foodstuff_capacity).ceil - 1) * rest_fish_time + cooking_total_time
    end
  end
end
