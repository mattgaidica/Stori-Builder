class Thought < ApplicationRecord
	has_many :strands, dependent: :destroy
	has_many :annotations, through: :strands

	def source_info
    source_ids = [];
    source_inc = [];
    nSource = 0;
    self.strands.each_with_index do |strand,index|
      source_id = strand.annotation.source.id;
      nSource += 1 if source_ids.index(source_id).nil?
      source_inc[index] = nSource
      source_ids[index] = source_id
    end
    [source_ids,source_inc]
  end
end