# README
![個人開発](https://user-images.githubusercontent.com/66311435/88628571-21212880-d0e9-11ea-8f9c-cd3347e3d552.jpg)

<h2 align="center">exercise_diary</h2>

## :link: アプリケーションの概要
<ul>
  <li>ダイエットしている方々のコミュニケーションアプリです。</li>
  <li>作成期間 2020/7/18 ~ 2020/7/28</li>
</ul>

## :link: アプリケーションの機能
<ul>
  <li>新規会員登録・ログインをすると日記の投稿、編集、削除ができます。</li>
  <li>新規会員登録、ログインがお済みでない方も商品の一覧、詳細を閲覧可能。</li>
  <li>投稿に対してコメントも可能。</li>
  <li>マイページにて自分の投稿を一覧できる。</li>
  <li>マイページにて天気予報を確認できる。</li>
</ul>

## :link: 主な使用言語

<p align="center">
  <a href="https://www.ruby-lang.org/ja/"><img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="45px;" /></a>
  <a href="https://railsguides.jp/getting_started.html"><img src="https://kuromame-blog.com/wp-content/uploads/rails-768x432.png" height="45px;" /></a>
  <a href="http://haml.info/"><img src="https://user-images.githubusercontent.com/39142850/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="45px;" /></a>
  <a href="https://sass-lang.com/"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Sass_Logo_Color.svg/144px-Sass_Logo_Color.svg.png" height="40px;" /></a>
  <a href="https://jquery.com/"><img src="https://syncer.jp/storage/web/brand-logos/static/dst/jquery-logo-001.png" height="45px;" /></a>
  <a href="https://github.co.jp/"><img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" height="45px;" /></a>
  <a href="https://aws.amazon.com/jp/"><img src="https://d0.awsstatic.com/logos/powered-by-aws.png" height="45px;" /></a>
</p>

## :page_facing_up: ER図

![データベース ER 図 (カラスの足記法)](https://user-images.githubusercontent.com/66311435/88774088-fb198800-d1bd-11ea-88a2-dacabda2d769.png)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :comments
- has_many :diaries
- has_one :address

### addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|prefecture_id|string|null: false|
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

### diariesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|content|text|null: false||
|image|string|null: false|
|diary_day|date|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :user
- accepts_nested_attributes_for :images, allow_destroy: true


### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|diary_id|references|null: false, foreign_key: true|
|text|text|null: false|
### Association
- belongs_to :diary
- belongs_to :user 