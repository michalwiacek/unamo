class KeywordSerializer < ActiveModel::Serializer
  attributes :name, :positions, :groups
  has_many :groups
  def positions
    customized_positions = []
    worst_o = object.positions.order(:occurrences).first.occurrences
    worst_d = object.positions.order(:occurrences).first.date
    best_o = object.positions.order(:occurrences).last.occurrences
    best_d = object.positions.order(:occurrences).last.date
    mean_o = object.positions.average(:occurrences)
    customized_positions.push("worst_ranking" => worst_o,"date_of_worst_occurrence" => worst_d,"best_ranking"=>best_o,"date_of_best_occurrence" => best_d, "mean_ranking" => mean_o)
    customized_positions
  end
  def groups
    customized_groups = []
    object.groups.each do |g|
      customized_groups.push(g.name)
    end
    customized_groups
  end
end
