class Search < ApplicationRecord

  def self.for(term)
    results = [];
    annot_ids = [];
    annot_count = 0;
    Source.where("title LIKE ? OR authors LIKE ?", "%#{term}%", "%#{term}%").order(created_at: :desc).each do |source|
      annot_ids = annot_ids | source.annotations.map(&:id)
      results[annot_count] = source.annotations.map(&:id).to_json
      annot_count += 1;
    end
    Annotation.where("body like ?", "%#{term}%").each do |annotation|
      unless annot_ids.include? annotation.id
        annot_ids << annotation.id
        results[annot_count] = [annotation.id].to_json
        annot_count += 1;
      end
    end
    return results
  end
end