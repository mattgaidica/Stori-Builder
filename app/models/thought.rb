class Thought < ApplicationRecord
	has_many :strands, dependent: :destroy
	has_many :annotations, through: :strands

	def source_info
    source_ids = [];
    source_inc = [];
    nSource = 0;
    self.strands.each_with_index do |strand,index|
      source_id = strand.annotation.source.id;
      source_ids[index] = source_id
      if source_ids.index(source_id).nil?
        nSource += 1
        source_inc[index] = nSource
      else
        source_inc[index] = source_ids.uniq.index(source_id) + 1
      end
    end
    [source_ids,source_inc]
  end
end