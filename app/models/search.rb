class Search < ApplicationRecord

  def self.for(term)
    results = [];
    annot_count = 0;
    Source.where("lower(title) LIKE ? OR lower(authors) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%").each do |source|
      source.annotations.each do |annotation|
        results[annot_count] = [source.id,annotation.id]
        annot_count += 1;
      end
    end
    cur_annots = results.map{|x,y| y} # gather all annotation_ids

    Annotation.where("lower(body) like ?", "%#{term.downcase}%").each do |annotation|
      unless cur_annots.index(annotation.id)
        results[annot_count] = [annotation.source_id,annotation.id]
        annot_count += 1;
      end
    end

    return results.sort.reverse
  end
end