class PagesController < ApplicationController
  def grakn
    grakn_string = "insert\n\n"
    Hashtag.all.each do |hashtag|
      grakn_string << "$keyword#{hashtag.id} isa keyword, has hashtag \"#{hashtag.content}\";\n"
    end
    tag_index = 0;
    Source.all.each do |source|
      grakn_string << "$source#{source.id} isa source, has title \"#{source.title}\", has authors \"#{source.authors}\";\n"
      source.hashtags.each do |hashtag|
        tag_index = tag_index + 1
        grakn_string << "$connection#{tag_index} (data: $source#{source.id}, topic: $keyword#{hashtag.id}) isa connection;\n"
      end
    end
    
    open('grakn/sources_data.gql', 'w') { |f|
      f.puts grakn_string
    }

    system("grakn server start")
    system("python3 grakn/grakn_run.py")
    system("grakn console -k stori -f grakn/sources_schema.gql")
    system("grakn console -k stori -f grakn/sources_data.gql")
    system("open -a 'Grakn\ Workbase'")
    # redirect_back(fallback_location: root_path)
  end

  def aylien
    Source.all.each do |source|
      source.aylien
    end
    redirect_to grakn_url
  end

  def dashboard
  end

  def reading
    @citations_read = Citation.where(is_read: true).order(updated_at: :desc)
    @citations_unread = Citation.where(is_read: false).order(:created_at)
  end
end