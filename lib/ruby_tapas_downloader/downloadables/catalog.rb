class RubyTapasDownloader::Downloadables::Catalog <
                                              RubyTapasDownloader::Downloadable

  attr_reader :episodes

  def initialize episodes
    @episodes = episodes
  end

  def download basepath, agent
    RubyTapasDownloader.logger.info 'Starting download of catalog in ' \
                                    "`#{ basepath }'..."
    FileUtils.mkdir_p basepath
    episodes.each { |episode| episode.download basepath, agent }
  end

  def == other
    episodes == other.episodes
  end

  def eql? other
    episodes.eql? other.episodes
  end

  def hash
    episodes.hash
  end
end
