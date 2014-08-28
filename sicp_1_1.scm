(print "1.1 プログラムの要素-------------")
(print "  1.1.1 式\n")
;; 式の並びを括弧で囲んで手続きの作用を表現するような式 = 組み合わせ(combinations)
;; 左端の要素 = 演算子(operator)
;; 他の要素   = 被演算子(operands)
;; 組合せの値は, 演算子が指定する手続きを, 被演算子の値である引数(arguments)に作用させる
(print (+ 1 10))
(print (* 2 2))

;; 左端に演算子(operator)があることで, 引数(arguments)を任意個とることができる
;; ネスト構造や複雑さに(原則として)制限はないので, 人が読みやすい形式(pretty print)で構造を明瞭化する
(print (+ 2 2 3 3))

(print (+ (* 3
             (+ (* 2 4)
                (+ 3 5)))
          (+ (- 10 7)
             6))
       )


(print "\n\n  1.1.2 名前と環境\n")
;; オブジェクトを値(value)とする変数(variable)を識別するのが名前である(変数識別子の事だと思う)
;; Schemeではdefineを使って名前をつける
(define size 2)
(print (* 5 size))

(define pi 3.14)
(define radius 10)
(print (* pi
          (* radius radius)
       ))
(define circumference (* 2 pi radius))
(print circumference)
;; 合成演算の結果を指すのにも名前を使う事ができる. これが最も簡単な抽象化の手段である.
;; 値と記号を対応づけて後続の処理で利用可能な状態にしておくためには,
;; 解釈系が値とオブジェクトの対を記憶しておく必要がある.
;; この記憶を環境(environment)という.
