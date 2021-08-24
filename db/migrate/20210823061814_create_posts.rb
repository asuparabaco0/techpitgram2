class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :caption
      # references型は参照先テーブル名の単数形+"_id"がカラム名として設定されるので、今回postsテーブルにはuser_idというカラムが追加される
      # foreign_key: true 外部キーとして使用する
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
