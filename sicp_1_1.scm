(print "1.1 プログラムの要素-------------")
(print "  1.1.1 式\n")
;; 式の並びを括弧で囲んで手続きの作用を表現するような式 = 組み合わせ(combinations)
;; 左端の要素 = 演算子(operator)
;; 他の要素   = 被演算子(operands)
;; 組合せの値は, 演算子が指定する手続きを, 被演算子の値である引数(arguments)に作用させる
;; 基本的な式は組合せ(combinations)ではない？
;; 1や'hoge'など
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
;; 本来計算は多くの異なる環境(environment)が存在するため,
;; より正確に表現するならばcircumferenceという変数は大域環境(global environment)にあるという.


(print "\n\n  1.1.3 組合せの評価\n")
;; 手続き的な考え方に注目する.
;; 組合せ(combinations)を評価するには次の事を行う ※あくまで以下の話は組合せの評価規則である
;; 1. 組合せ(combinations)の部分式を評価する
;; 2. 演算子(operator)を, 引数(arguments)に適応させる
(print (* (+ 2(* 4 6)
          (+ 3 5 7))
       ))
;; 上記の例が, (* 26 15) になるまで1. ~ 2.の評価を再帰的続ける.
;; この評価は木構造に表すと, 終端の節点から始まり, 上方へと流れていく.
;; 評価規則は「値が上方へ湧き出す」
;; この構造は木構造の溜め込み(tree accumulation)として知られる一般的処理の一例.
;; 組合せの評価規則の1.を再帰的に繰り返していくと, 評価する必要のない数字列, 文字列, 演算子, 変数のような
;; 組合せ(combinations)ではない「基本的式」への地点へと到る.
;; 「基本的な式」は次のように扱う.
;;
;; - 数字列の値は, その表す数値とする
;; - 基本演算子の値は, 対応する演算を実行する機械命令の列とする
;; - それ以外の名前の値は, その環境で名前と対応づけたオブジェクトとする
;;
;; +などの基本演算子は大域環境(global environment)に含まれていて, その値である機械命令の列に対応づけられていると想定すれば,
;; 第二第三の規則は特例と観ても良い.
;; 環境が異なれば, (+ x 1)の記号x（あるいは+)の値は変化する.
;; つまり「環境とは評価が行われる文脈を提供するものである」
;;
;; 上の評価規則は, 定義を扱わない.
;; (define x 3)は二つの引数(arguments)に作用させるものではない.
;; defineの目的はxに3を対応付ける事なので, 組合せ(combinations)ではない.
;;
;; このような一般評価規則の例外を「特殊形式(special forms)」という.
;; 特殊形式(special forms)はそれぞれ独自の評価規則を持つ.
