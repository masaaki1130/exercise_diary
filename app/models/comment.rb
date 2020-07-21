class Comment < ApplicationRecord
  belongs_to :diary  # diariesテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
