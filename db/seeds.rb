# db/seeds.rb

# 問題データを格納する配列
questions = [
  # 交通規則に関する問題
  { category: "交通規則", content: "車を運転する際には、運転免許証を常に携帯する必要がある。", correct_answer: "A" },
  { category: "交通規則", content: "踏切では、車のエンジンが停止した場合、まず列車が来ないことを確認し、車を移動させることが最優先である。", correct_answer: "A" },
  { category: "交通規則", content: "信号が青に変わったら、歩行者や他の車両を確認する必要はない。", correct_answer: "B" },
  { category: "交通規則", content: "高速道路では最低速度が規定されており、それ以下で走行してはならない。", correct_answer: "A" },
  { category: "交通規則", content: "追い越し禁止の場所でも、後続車が速く進む意思を示した場合は、追い越しを許可する必要がある。", correct_answer: "B" },

  # 道路標識に関する問題
  { category: "道路標識", content: "「徐行」の標識がある場合、車両は必ず一時停止しなければならない。", correct_answer: "B" },
  { category: "道路標識", content: "「駐停車禁止」の標識がある場所では、荷物の積み下ろしや乗降のための停止も許されない。", correct_answer: "B" },
  { category: "道路標識", content: "「車両通行止め」の標識がある場合、自転車も通行してはいけない。", correct_answer: "A" },
  { category: "道路標識", content: "「追い越し禁止」の標識がある道路では、自転車を追い越すことも禁止されている。", correct_answer: "B" },
  { category: "道路標識", content: "「歩行者専用」の標識がある場合、緊急車両も通行することはできない。", correct_answer: "B" },

  # 安全運転に関する問題
  { category: "安全運転", content: "雨の日はブレーキの効きが悪くなるため、通常よりも車間距離を広く取る必要がある。", correct_answer: "A" },
  { category: "安全運転", content: "夜間の運転では、ハイビームを使用しても対向車がいなければ問題ない。", correct_answer: "A" },
  { category: "安全運転", content: "急ブレーキを避けるために、前方の状況を早めに予測し、適切な減速を心がけるべきである。", correct_answer: "A" },
  { category: "安全運転", content: "二輪車の横を通過する際は、可能な限り十分な側方間隔を保つ必要がある。", correct_answer: "A" },
  { category: "安全運転", content: "運転中にスマートフォンを操作することは、法律で禁止されている。", correct_answer: "A" },

  # 駐車と停車に関する問題
  { category: "駐車と停車", content: "交差点から5メートル以内の場所は駐車禁止である。", correct_answer: "A" },
  { category: "駐車と停車", content: "坂道では、停車時に必ずサイドブレーキを使用しなければならない。", correct_answer: "A" },
  { category: "駐車と停車", content: "消防用設備の周囲5メートル以内の場所に駐車することは許可されている。", correct_answer: "B" },
  { category: "駐車と停車", content: "横断歩道や自転車横断帯の前後5メートル以内の場所では、駐停車が禁止されている。", correct_answer: "A" },
  { category: "駐車と停車", content: "夜間に路肩に駐車する場合、車幅灯や尾灯を点灯しなければならない。", correct_answer: "A" },

  # 緊急時の対応に関する問題
  { category: "緊急時の対応", content: "運転中にエンジンが故障した場合、周囲に危険を及ぼさない場所まで惰性で移動してもよい。", correct_answer: "A" },
  { category: "緊急時の対応", content: "事故現場では、まず救助活動を行い、その後警察に通報する必要がある。", correct_answer: "A" },
  { category: "緊急時の対応", content: "車が燃えた場合、水をかけて消火するのが最善の方法である。", correct_answer: "B" },
  { category: "緊急時の対応", content: "故障車を高速道路の路肩に止める場合、停止表示板を置くことが義務付けられている。", correct_answer: "A" },
  { category: "緊急時の対応", content: "タイヤがパンクした場合は、すぐに路肩に停止し、ハザードランプを点けるべきである。", correct_answer: "A" },

  # その他の規則や注意事項
  { category: "その他", content: "初心者マークを表示している車には、後続車は必ず車間距離を広げる義務がある。", correct_answer: "B" },
  { category: "その他", content: "運転中に眠気を感じた場合、安全な場所で休憩を取るべきである。", correct_answer: "A" },
  { category: "その他", content: "エコドライブでは、急発進・急加速を避けることが推奨される。", correct_answer: "A" },
  { category: "その他", content: "高速道路では、緊急時以外で停車することは禁じられている。", correct_answer: "A" },
  { category: "その他", content: "二輪車の運転中は、ヘルメットの着用が義務付けられている。", correct_answer: "A" },
  { category: "その他", content: "運転中に眠気を感じた場合、安全な場所で休憩を取るべきである。", correct_answer: "A" },
  { category: "その他", content: "運転免許の有効期限が切れた場合、すぐに運転を再開しても問題ない。", correct_answer: "B" }
]

# データベースに保存
questions.each do |q|
  Question.create!(
    category: q[:category],
    content: q[:content],
    correct_answer: q[:correct_answer]  # 'answer' を 'correct_answer' に変更
  )
end

puts "すべての問題がデータベースに追加されました！"

