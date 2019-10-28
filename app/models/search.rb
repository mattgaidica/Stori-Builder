class Search < ApplicationRecord

  def self.for(term)
    results = [];
    annot_count = 0;
    # hashtags
    cur_annots = results.map{|x,y| x} # gather all source_ids
    Hashtag.where("lower(content) LIKE ?", "%#{term.downcase}%").each do |hashtag|
      hashtag.sources.each do |source|
        unless cur_annots.index(source.id)
          source.annotations.each do |annotation|
            # results[annot_count] = [source.id,nil] # only attach source
            results[annot_count] = [source.id,annotation.id] # attach source and annotations
            annot_count += 1;
          end
        end
      end
    end
    # title
    Source.where("lower(title) LIKE ? OR lower(authors) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%").each do |source|
      source.annotations.each do |annotation|
        results[annot_count] = [source.id,nil] # only attach source
        # results[annot_count] = [source.id,annotation.id] # attach source and annotations
        annot_count += 1;
      end
    end
    # annotations
    cur_annots = results.map{|x,y| y} # gather all annotation_ids
    Annotation.where("lower(body) LIKE ?", "%#{term.downcase}%").each do |annotation|
      unless cur_annots.index(annotation.id)
        results[annot_count] = [annotation.source_id,annotation.id]
        annot_count += 1;
      end
    end
    
    return results
  end
end