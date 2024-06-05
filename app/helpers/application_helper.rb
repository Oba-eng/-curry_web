module ApplicationHelper
  def default_meta_tags
    {
      site: 'curry-web',
      title: 'オリジナルカレー投稿アプリ',
      reverse: true,
      charset: 'utf-8',
      description: 'curry-webを使えばさまざまな人のオリジナルカレーレシピを見ることができます。',
      keywords: 'カレー,スパイスカレー,カレーレシピ',
      canonical: "https://www.carry-web.net#{request.original_fullpath}",
      separator: '|',
      og: {
        site_name: 'curry-web',
        title: 'オリジナルカレー投稿アプリ',
        description: 'curry-webを使えばさまざまな人のオリジナルカレーレシピを見ることができます。',
        type: 'website',
        url: "https://www.carry-web.net#{request.original_fullpath}",
        image: image_url('ogp.png'),
        locale: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        # site: '@your_twitter_handle', # Twitterハンドルに置き換えます
        title: 'オリジナルカレー投稿アプリ',
        description: 'curry-webを使えばさまざまな人のオリジナルカレーレシピを見ることができます。',
        image: image_url('ogp.png')
      }
    }
  end
end
