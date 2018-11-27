class Search < ApplicationRecord

  def self.for(term)
    results = [];
    annot_count = 0;
    Source.where("title LIKE ? OR authors LIKE ?", "%#{term}%", "%#{term}%").each do |source|
      source.annotations.each do |annotation|
        results[annot_count] = [source.id,annotation.id]
        annot_count += 1;
      end
    end

    Annotation.where("body like ?", "%#{term}%").each do |annotation|
      results[annot_count] = [annotation.source_id,annotation.id]
      annot_count += 1;
    end

    return results.sort.reverse
  end
end