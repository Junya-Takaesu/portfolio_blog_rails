class Portfolio::List
  PORTFOLIO_BY_ID = {
    1 => {name: "Twitter の検索ツール", url: "https://intense-anchorage-29672.herokuapp.com/"},
    2 => {name: "ただのランディングページ", url: "https://t.co/hE1bhiRln2"},
    3 => {name: "Base64 Encoder/Decoder", url: "https://t.co/Uz0GPlXrt5"},
    4 => {name: "◯✗ゲーム", url: "https://t.co/Y9r0C1uuBC"},
  }

  def initialize
  end

  def self.reverse
    PORTFOLIO_BY_ID.sort_by {|k, v| -k}
  end
end