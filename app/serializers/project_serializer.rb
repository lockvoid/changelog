class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :notices

  def notices
    release = object.releases.order(date: :desc).first

    if release
      release.notices
    end
  end

  class NoticeSerializer < ActiveModel::Serializer
    attributes :id, :heading, :body, :target_element_selector

    def body
      Kramdown::Document.new(object.body).to_html
    end
  end
end
