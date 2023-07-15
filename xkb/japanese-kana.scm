;;;
;;; Copyright (c) 2003-2013 uim Project https://github.com/uim/uim
;;;
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;; 1. Redistributions of source code must retain the above copyright
;;;    notice, this list of conditions and the following disclaimer.
;;; 2. Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;; 3. Neither the name of authors nor the names of its contributors
;;;    may be used to endorse or promote products derived from this software
;;;    without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' AND
;;; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE
;;; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
;;; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;;; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
;;; OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
;;; SUCH DAMAGE.
;;;;

;; ja-kana-hiragana rule and ja-kana-katakana-rule should be merged.

(define ja-kana-hiragana-rule
  '(
    ((("#"). ("ぁ"))())
    ((("E"). ("ぃ"))())
    ((("$"). ("ぅ"))())
    ((("%"). ("ぇ"))())
    ((("^"). ("ぉ"))())
    ((("'"). ("け"))())
    ((("("). ("ょ"))())
    (((")"). ("を"))())
    ((("~"). (""))())
    ((("Z"). ("っ"))())
    ((("y"). ("ん"))())
    ((("3"). ("あ"))())
    ((("e"). ("い"))())
    ((("4"). ("う"))())
    ((("5"). ("え"))())
    ((("6"). ("お"))())
    ((("t"). ("か"))())
    ((("g"). ("き"))())
    ((("h"). ("く"))())
    (((":"). ("れ"))())
    ((("b"). ("こ"))())
    ((("x"). ("さ"))())
    ((("d"). ("し"))())
    ((("r"). ("す"))())
    ((("p"). ("せ"))())
    ((("c"). ("そ"))())
    ((("q"). ("た"))())
    ((("a"). ("ち"))())
    ((("z"). ("つ"))())
    ((("w"). ("て"))())
    ((("s"). ("と"))())
    ((("u"). ("な"))())
    ((("i"). ("に"))())
    ((("1"). ("ぬ"))())
    (((","). ("ね"))())
    ((("k"). ("の"))())
    ((("f"). ("は"))())
    ((("v"). ("ひ"))())
    ((("2"). ("ふ"))())
    ((("&"). ("ゃ"))())
    ((("-"). ("ほ"))())
    ((("j"). ("ま"))())
    ((("n"). ("み"))())
    ((("}"). ("」"))())
    ((("/"). ("め"))())
    ((("m"). ("も"))())
    ((("7"). ("や"))())
    ((("8"). ("ゆ"))())
    ((("9"). ("よ"))())
    ((("o"). ("ら"))())
    ((("l"). ("り"))())
    ((("."). ("る"))())
    (((";"). ("れ"))())
    ((("0"). ("わ"))())
    ((("_"). ("ー"))())
    ((("T"). ("か"))())
    ((("G"). ("き"))())
    ((("H"). ("く"))())
    ((("*"). ("ゅ"))())
    ((("B"). ("こ"))())
    ((("X"). ("さ"))())
    ((("D"). ("し"))())
    ((("R"). ("す"))())
    ((("P"). ("せ"))())
    ((("C"). ("そ"))())
    ((("Q"). ("た"))())
    ((("A"). ("ち"))())
    ((("W"). ("て"))())
    ((("S"). ("と"))())
    ((("U"). ("な"))())
    ((("I"). ("に"))())
    ((("!"). ("ぬ"))())
    ((("K"). ("の"))())
    ((("F"). ("は"))())
    ((("V"). ("ひ"))())
    ((("\""). ("ふ"))())
    ((("="). ("へ"))())
    ((("J"). ("ま"))())
    ((("N"). ("み"))())
    ((("M"). ("も"))())
    ((("O"). ("ら"))())
    ((("L"). ("り"))())
    ((("+"). ("へ"))())
    ((("_"). ("ー"))())
    ((("Y"). ("ん"))())
    ((("`"). ("ろ"))())
    ((("yen"). ("ー"))())

    ((("kana-a"). ("ぁ"))())
    ((("kana-i"). ("ぃ"))())
    ((("kana-u"). ("ぅ"))())
    ((("kana-e"). ("ぇ"))())
    ((("kana-o"). ("ぉ"))())
    ((("kana-ya"). ("ゃ"))())
    ((("kana-yu"). ("ゅ"))())
    ((("kana-yo"). ("ょ"))())
    ((("kana-WO"). ("を"))())
    ((("kana-tsu"). ("っ"))())
    ((("kana-N"). ("ん"))())
    ((("kana-A"). ("あ"))())
    ((("kana-I"). ("い"))())
    ((("kana-U"). ("う"))())
    ((("kana-E"). ("え"))())
    ((("kana-O"). ("お"))())
    ((("kana-KA"). ("か"))())
    ((("kana-KI"). ("き"))())
    ((("kana-KU"). ("く"))())
    ((("kana-KE"). ("け"))())
    ((("kana-KO"). ("こ"))())
    ((("kana-SA"). ("さ"))())
    ((("kana-SHI"). ("し"))())
    ((("kana-SU"). ("す"))())
    ((("kana-SE"). ("せ"))())
    ((("kana-SO"). ("そ"))())
    ((("kana-TA"). ("た"))())
    ((("kana-CHI"). ("ち"))())
    ((("kana-TSU"). ("つ"))())
    ((("kana-TE"). ("て"))())
    ((("kana-TO"). ("と"))())
    ((("kana-NA"). ("な"))())
    ((("kana-NI"). ("に"))())
    ((("kana-NU"). ("ぬ"))())
    ((("kana-NE"). ("ね"))())
    ((("kana-NO"). ("の"))())
    ((("kana-HA"). ("は"))())
    ((("kana-HI"). ("ひ"))())
    ((("kana-FU"). ("ふ"))())
    ((("kana-HE"). ("へ"))())
    ((("kana-HO"). ("ほ"))())
    ((("kana-MA"). ("ま"))())
    ((("kana-MI"). ("み"))())
    ((("kana-MU"). ("む"))())
    ((("kana-ME"). ("め"))())
    ((("kana-MO"). ("も"))())
    ((("kana-YA"). ("や"))())
    ((("kana-YU"). ("ゆ"))())
    ((("kana-YO"). ("よ"))())
    ((("kana-RA"). ("ら"))())
    ((("kana-RI"). ("り"))())
    ((("kana-RU"). ("る"))())
    ((("kana-RE"). ("れ"))())
    ((("kana-RO"). ("ろ"))())
    ((("kana-WA"). ("わ"))())
    ((("kana-prolonged-sound"). ("ー"))())

    ((("か" "["). ())("が" ""))
    ((("き" "["). ())("ぎ" ""))
    ((("く" "["). ())("ぐ" ""))
    ((("け" "["). ())("げ" ""))
    ((("こ" "["). ())("ご" ""))
    ((("さ" "["). ())("ざ" ""))
    ((("し" "["). ())("じ" ""))
    ((("す" "["). ())("ず" ""))
    ((("せ" "["). ())("ぜ" ""))
    ((("そ" "["). ())("ぞ" ""))
    ((("た" "["). ())("だ" ""))
    ((("ち" "["). ())("ぢ" ""))
    ((("つ" "["). ())("づ" ""))
    ((("て" "["). ())("で" ""))
    ((("と" "["). ())("ど" ""))
    ((("は" "["). ())("ば" ""))
    ((("ひ" "["). ())("び" ""))
    ((("ふ" "["). ())("ぶ" ""))
    ((("へ" "["). ())("べ" ""))
    ((("ほ" "["). ())("ぼ" ""))
    ((("は" "]"). ())("ぱ" ""))
    ((("ひ" "]"). ())("ぴ" ""))
    ((("ふ" "]"). ())("ぷ" ""))
    ((("へ" "]"). ())("ぺ" ""))
    ((("ほ" "]"). ())("ぽ" ""))
    
    ((("か" "kana-voiced-sound"). ())("が" ""))
    ((("き" "kana-voiced-sound"). ())("ぎ" ""))
    ((("く" "kana-voiced-sound"). ())("ぐ" ""))
    ((("け" "kana-voiced-sound"). ())("げ" ""))
    ((("こ" "kana-voiced-sound"). ())("ご" ""))
    ((("さ" "kana-voiced-sound"). ())("ざ" ""))
    ((("し" "kana-voiced-sound"). ())("じ" ""))
    ((("す" "kana-voiced-sound"). ())("ず" ""))
    ((("せ" "kana-voiced-sound"). ())("ぜ" ""))
    ((("そ" "kana-voiced-sound"). ())("ぞ" ""))
    ((("た" "kana-voiced-sound"). ())("だ" ""))
    ((("ち" "kana-voiced-sound"). ())("ぢ" ""))
    ((("つ" "kana-voiced-sound"). ())("づ" ""))
    ((("て" "kana-voiced-sound"). ())("で" ""))
    ((("と" "kana-voiced-sound"). ())("ど" ""))
    ((("は" "kana-voiced-sound"). ())("ば" ""))
    ((("ひ" "kana-voiced-sound"). ())("び" ""))
    ((("ふ" "kana-voiced-sound"). ())("ぶ" ""))
    ((("へ" "kana-voiced-sound"). ())("べ" ""))
    ((("ほ" "kana-voiced-sound"). ())("ぼ" ""))
    ((("は" "kana-semivoiced-sound"). ())("ぱ" ""))
    ((("ひ" "kana-semivoiced-sound"). ())("ぴ" ""))
    ((("ふ" "kana-semivoiced-sound"). ())("ぷ" ""))
    ((("へ" "kana-semivoiced-sound"). ())("ぺ" ""))
    ((("ほ" "kana-semivoiced-sound"). ())("ぽ" ""))

    (((">"). ("。"))())
    ((("<"). ("、"))())
    ((("?"). ("・"))())
    ((("["). ("゛"))())
    ((("]"). ("゜"))())
    ((("{"). ("「"))())
    ((("}"). ("」"))())
    
    ((("kana-fullstop"). ("。"))())
    ((("kana-comma"). ("、"))())
    ((("kana-conjunctive"). ("・"))())
    ((("kana-voiced-sound"). ("゛"))())
    ((("kana-semivoiced-sound"). ("゜"))())
    ((("kana-opening-bracket"). ("「"))())
    ((("kana-closing-bracket"). ("」"))())

    ((("ぁ"). ())("ぁ"))
    ((("ぃ"). ())("ぃ"))
    ((("ぅ"). ())("ぅ"))
    ((("ぇ"). ())("ぇ"))
    ((("ぉ"). ())("ぉ"))
    ((("ゃ"). ())("ゃ"))
    ((("ゅ"). ())("ゅ"))
    ((("ょ"). ())("ょ"))
    ((("を"). ())("を"))
    ((("っ"). ())("っ"))
    ((("ん"). ())("ん"))
    ((("あ"). ())("あ"))
    ((("い"). ())("い"))
    ((("う"). ())("う"))
    ((("え"). ())("え"))
    ((("お"). ())("お"))
    ((("か"). ())("か"))
    ((("き"). ())("き"))
    ((("く"). ())("く"))
    ((("け"). ())("け"))
    ((("こ"). ())("こ"))
    ((("さ"). ())("さ"))
    ((("し"). ())("し"))
    ((("す"). ())("す"))
    ((("せ"). ())("せ"))
    ((("そ"). ())("そ"))
    ((("た"). ())("た"))
    ((("ち"). ())("ち"))
    ((("つ"). ())("つ"))
    ((("て"). ())("て"))
    ((("と"). ())("と"))
    ((("な"). ())("な"))
    ((("に"). ())("に"))
    ((("ぬ"). ())("ぬ"))
    ((("ね"). ())("ね"))
    ((("の"). ())("の"))
    ((("は"). ())("は"))
    ((("ひ"). ())("ひ"))
    ((("ふ"). ())("ふ"))
    ((("へ"). ())("へ"))
    ((("ほ"). ())("ほ"))
    ((("ま"). ())("ま"))
    ((("み"). ())("み"))
    ((("む"). ())("む"))
    ((("め"). ())("め"))
    ((("も"). ())("も"))
    ((("や"). ())("や"))
    ((("ゆ"). ())("ゆ"))
    ((("よ"). ())("よ"))
    ((("ら"). ())("ら"))
    ((("り"). ())("り"))
    ((("る"). ())("る"))
    ((("れ"). ())("れ"))
    ((("わ"). ())("わ"))
    ((("ー"). ())("ー"))
    ((("ろ"). ())("ろ"))
    ((("。"). ())("。"))
    ((("、"). ())("、"))
    ((("・"). ())("・"))
    ((("゛"). ())("゛"))
    ((("゜"). ())("゜"))
    ((("「"). ())("「"))
    ((("」"). ())("」"))

    ))

(define ja-kana-katakana-rule
  '(
    ((("#"). ("ァ"))())
    ((("E"). ("ィ"))())
    ((("$"). ("ゥ"))())
    ((("%"). ("ェ"))())
    ((("&"). ("ォ"))())
    ((("'"). ("ャ"))())
    ((("("). ("ュ"))())
    (((")"). ("ョ"))())
    ((("~"). ("ヲ"))())
    ((("Z"). ("ッ"))())
    ((("y"). ("ン"))())
    ((("3"). ("ア"))())
    ((("e"). ("イ"))())
    ((("4"). ("ウ"))())
    ((("5"). ("エ"))())
    ((("6"). ("オ"))())
    ((("t"). ("カ"))())
    ((("g"). ("キ"))())
    ((("h"). ("ク"))())
    (((":"). ("ケ"))())
    ((("b"). ("コ"))())
    ((("x"). ("サ"))())
    ((("d"). ("シ"))())
    ((("r"). ("ス"))())
    ((("p"). ("セ"))())
    ((("c"). ("ソ"))())
    ((("q"). ("タ"))())
    ((("a"). ("チ"))())
    ((("z"). ("ツ"))())
    ((("w"). ("テ"))())
    ((("s"). ("ト"))())
    ((("u"). ("ナ"))())
    ((("i"). ("ニ"))())
    ((("1"). ("ヌ"))())
    (((","). ("ネ"))())
    ((("k"). ("ノ"))())
    ((("f"). ("ハ"))())
    ((("v"). ("ヒ"))())
    ((("2"). ("フ"))())
    ((("^"). ("ヘ"))())
    ((("-"). ("ホ"))())
    ((("j"). ("マ"))())
    ((("n"). ("ミ"))())
    ((("]"). ("ム"))())
    ((("/"). ("メ"))())
    ((("m"). ("モ"))())
    ((("7"). ("ヤ"))())
    ((("8"). ("ユ"))())
    ((("9"). ("ヨ"))())
    ((("o"). ("ラ"))())
    ((("l"). ("リ"))())
    ((("."). ("ル"))())
    (((";"). ("レ"))())
    ((("0"). ("ワ"))())
    ((("|"). ("ー"))())
    ((("T"). ("カ"))())
    ((("G"). ("キ"))())
    ((("H"). ("ク"))())
    ((("*"). ("ケ"))())
    ((("B"). ("コ"))())
    ((("X"). ("サ"))())
    ((("D"). ("シ"))())
    ((("R"). ("ス"))())
    ((("P"). ("セ"))())
    ((("C"). ("ソ"))())
    ((("Q"). ("タ"))())
    ((("A"). ("チ"))())
    ((("W"). ("テ"))())
    ((("S"). ("ト"))())
    ((("U"). ("ナ"))())
    ((("I"). ("ニ"))())
    ((("!"). ("ヌ"))())
    ((("K"). ("ノ"))())
    ((("F"). ("ハ"))())
    ((("V"). ("ヒ"))())
    ((("\""). ("フ"))())
    ((("="). ("ホ"))())
    ((("J"). ("マ"))())
    ((("N"). ("ミ"))())
    ((("M"). ("モ"))())
    ((("O"). ("ラ"))())
    ((("L"). ("リ"))())
    ((("+"). ("レ"))())
    ((("_"). ("ロ"))())
    ((("Y"). ("ン"))())
    ((("\\"). ("ロ"))())
    ((("yen"). ("ー"))())

    ((("kana-a"). ("ァ"))())
    ((("kana-i"). ("ィ"))())
    ((("kana-u"). ("ゥ"))())
    ((("kana-e"). ("ェ"))())
    ((("kana-o"). ("ォ"))())
    ((("kana-ya"). ("ャ"))())
    ((("kana-yu"). ("ュ"))())
    ((("kana-yo"). ("ョ"))())
    ((("kana-wo"). ("ヲ"))())
    ((("kana-tsu"). ("ッ"))())
    ((("kana-N"). ("ン"))())
    ((("kana-A"). ("ア"))())
    ((("kana-I"). ("イ"))())
    ((("kana-U"). ("ウ"))())
    ((("kana-E"). ("エ"))())
    ((("kana-O"). ("オ"))())
    ((("kana-KA"). ("カ"))())
    ((("kana-KI"). ("キ"))())
    ((("kana-KU"). ("ク"))())
    ((("kana-KE"). ("ケ"))())
    ((("kana-KO"). ("コ"))())
    ((("kana-SA"). ("サ"))())
    ((("kana-SHI"). ("シ"))())
    ((("kana-SU"). ("ス"))())
    ((("kana-SE"). ("セ"))())
    ((("kana-SO"). ("ソ"))())
    ((("kana-TA"). ("タ"))())
    ((("kana-CHI"). ("チ"))())
    ((("kana-TSU"). ("ツ"))())
    ((("kana-TE"). ("テ"))())
    ((("kana-TO"). ("ト"))())
    ((("kana-NA"). ("ナ"))())
    ((("kana-NI"). ("ニ"))())
    ((("kana-NU"). ("ヌ"))())
    ((("kana-NE"). ("ネ"))())
    ((("kana-NO"). ("ノ"))())
    ((("kana-HA"). ("ハ"))())
    ((("kana-HI"). ("ヒ"))())
    ((("kana-FU"). ("フ"))())
    ((("kana-HE"). ("ヘ"))())
    ((("kana-HO"). ("ホ"))())
    ((("kana-MA"). ("マ"))())
    ((("kana-MI"). ("ミ"))())
    ((("kana-MU"). ("ム"))())
    ((("kana-ME"). ("メ"))())
    ((("kana-MO"). ("モ"))())
    ((("kana-YA"). ("ヤ"))())
    ((("kana-YU"). ("ユ"))())
    ((("kana-YO"). ("ヨ"))())
    ((("kana-RA"). ("ラ"))())
    ((("kana-RI"). ("リ"))())
    ((("kana-RU"). ("ル"))())
    ((("kana-RE"). ("レ"))())
    ((("kana-RO"). ("ロ"))())
    ((("kana-WA"). ("ワ"))())
    ((("kana-prolonged-sound"). ("ー"))())

    ((("カ" "@"). ())("ガ"))
    ((("キ" "@"). ())("ギ"))
    ((("ク" "@"). ())("グ"))
    ((("ケ" "@"). ())("ゲ"))
    ((("コ" "@"). ())("ゴ"))
    ((("サ" "@"). ())("ザ"))
    ((("シ" "@"). ())("ジ"))
    ((("ス" "@"). ())("ズ"))
    ((("セ" "@"). ())("ゼ"))
    ((("ソ" "@"). ())("ゾ"))
    ((("タ" "@"). ())("ダ"))
    ((("チ" "@"). ())("ヂ"))
    ((("ツ" "@"). ())("ヅ"))
    ((("テ" "@"). ())("デ"))
    ((("ト" "@"). ())("ド"))
    ((("ハ" "@"). ())("バ"))
    ((("ヒ" "@"). ())("ビ"))
    ((("フ" "@"). ())("ブ"))
    ((("ヘ" "@"). ())("ベ"))
    ((("ホ" "@"). ())("ボ"))
    ((("ハ" "["). ())("パ"))
    ((("ヒ" "["). ())("ピ"))
    ((("フ" "["). ())("プ"))
    ((("ヘ" "["). ())("ペ"))
    ((("ホ" "["). ())("ポ"))
    ((("カ" "`"). ())("ガ"))
    ((("キ" "`"). ())("ギ"))
    ((("ク" "`"). ())("グ"))
    ((("ケ" "`"). ())("ゲ"))
    ((("コ" "`"). ())("ゴ"))
    ((("サ" "`"). ())("ザ"))
    ((("シ" "`"). ())("ジ"))
    ((("ス" "`"). ())("ズ"))
    ((("セ" "`"). ())("ゼ"))
    ((("ソ" "`"). ())("ゾ"))
    ((("タ" "`"). ())("ダ"))
    ((("チ" "`"). ())("ヂ"))
    ((("ツ" "`"). ())("ヅ"))
    ((("テ" "`"). ())("デ"))
    ((("ト" "`"). ())("ド"))
    ((("ハ" "`"). ())("バ"))
    ((("ヒ" "`"). ())("ビ"))
    ((("フ" "`"). ())("ブ"))
    ((("ヘ" "`"). ())("ベ"))
    ((("ホ" "`"). ())("ボ"))

    ((("カ" "kana-voiced-sound"). ())("ガ"))
    ((("キ" "kana-voiced-sound"). ())("ギ"))
    ((("ク" "kana-voiced-sound"). ())("グ"))
    ((("ケ" "kana-voiced-sound"). ())("ゲ"))
    ((("コ" "kana-voiced-sound"). ())("ゴ"))
    ((("サ" "kana-voiced-sound"). ())("ザ"))
    ((("シ" "kana-voiced-sound"). ())("ジ"))
    ((("ス" "kana-voiced-sound"). ())("ズ"))
    ((("セ" "kana-voiced-sound"). ())("ゼ"))
    ((("ソ" "kana-voiced-sound"). ())("ゾ"))
    ((("タ" "kana-voiced-sound"). ())("ダ"))
    ((("チ" "kana-voiced-sound"). ())("ヂ"))
    ((("ツ" "kana-voiced-sound"). ())("ヅ"))
    ((("テ" "kana-voiced-sound"). ())("デ"))
    ((("ト" "kana-voiced-sound"). ())("ド"))
    ((("ハ" "kana-voiced-sound"). ())("バ"))
    ((("ヒ" "kana-voiced-sound"). ())("ビ"))
    ((("フ" "kana-voiced-sound"). ())("ブ"))
    ((("ヘ" "kana-voiced-sound"). ())("ベ"))
    ((("ホ" "kana-voiced-sound"). ())("ボ"))
    ((("ハ" "kana-semivoiced-sound"). ())("パ"))
    ((("ヒ" "kana-semivoiced-sound"). ())("ピ"))
    ((("フ" "kana-semivoiced-sound"). ())("プ"))
    ((("ヘ" "kana-semivoiced-sound"). ())("ペ"))
    ((("ホ" "kana-semivoiced-sound"). ())("ポ"))

    (((">"). ("。"))())
    ((("<"). ("、"))())
    ((("?"). ("・"))())
    ((("@"). ("゛"))())
    ((("["). ("゜"))())
    ((("{"). ("「"))())
    ((("}"). ("」"))())
    ((("`"). ("゛"))())

    ((("kana-fullstop"). ("。"))())
    ((("kana-comma"). ("、"))())
    ((("kana-conjunctive"). ("・"))())
    ((("kana-voiced-sound"). ("゛"))())
    ((("kana-semivoiced-sound"). ("゜"))())
    ((("kana-opening-bracket"). ("「"))())
    ((("kana-closing-bracket"). ("」"))())

    ((("ァ"). ())("ァ"))
    ((("ィ"). ())("ィ"))
    ((("ゥ"). ())("ゥ"))
    ((("ェ"). ())("ェ"))
    ((("ォ"). ())("ォ"))
    ((("ャ"). ())("ヤ"))
    ((("ュ"). ())("ュ"))
    ((("ョ"). ())("ョ"))
    ((("ヲ"). ())("ヲ"))
    ((("ッ"). ())("ッ"))
    ((("ン"). ())("ン"))
    ((("ア"). ())("ア"))
    ((("イ"). ())("イ"))
    ((("ウ"). ())("ウ"))
    ((("エ"). ())("エ"))
    ((("オ"). ())("オ"))
    ((("カ"). ())("カ"))
    ((("キ"). ())("キ"))
    ((("ク"). ())("ク"))
    ((("ケ"). ())("ケ"))
    ((("コ"). ())("コ"))
    ((("サ"). ())("サ"))
    ((("シ"). ())("シ"))
    ((("ス"). ())("ス"))
    ((("セ"). ())("セ"))
    ((("ソ"). ())("ソ"))
    ((("タ"). ())("タ"))
    ((("チ"). ())("チ"))
    ((("ツ"). ())("ツ"))
    ((("テ"). ())("テ"))
    ((("ト"). ())("ト"))
    ((("ナ"). ())("ナ"))
    ((("ニ"). ())("ニ"))
    ((("ヌ"). ())("ヌ"))
    ((("ネ"). ())("ネ"))
    ((("ノ"). ())("ノ"))
    ((("ハ"). ())("ハ"))
    ((("ヒ"). ())("ヒ"))
    ((("フ"). ())("フ"))
    ((("ヘ"). ())("ヘ"))
    ((("ホ"). ())("ホ"))
    ((("マ"). ())("マ"))
    ((("ミ"). ())("ミ"))
    ((("ム"). ())("ム"))
    ((("メ"). ())("メ"))
    ((("モ"). ())("モ"))
    ((("ヤ"). ())("ヤ"))
    ((("ユ"). ())("ユ"))
    ((("ヨ"). ())("ヨ"))
    ((("ラ"). ())("ラ"))
    ((("リ"). ())("リ"))
    ((("ル"). ())("ル"))
    ((("レ"). ())("レ"))
    ((("ロ"). ())("ロ"))
    ((("ワ"). ())("ワ"))
    ((("ー"). ())("ー"))
    ((("。"). ())("。"))
    ((("、"). ())("、"))
    ((("・"). ())("・"))
    ((("゛"). ())("゛"))
    ((("゜"). ())("゜"))
    ((("「"). ())("「"))
    ((("」"). ())("」"))
    ))

(define ja-kana-halfkana-rule
  '(
    ((("#"). ("ｧ"))())
    ((("E"). ("ｨ"))())
    ((("$"). ("ｩ"))())
    ((("%"). ("ｪ"))())
    ((("&"). ("ｫ"))())
    ((("'"). ("ｬ"))())
    ((("("). ("ｭ"))())
    (((")"). ("ｮ"))())
    ((("~"). ("ｦ"))())
    ((("Z"). ("ｯ"))())
    ((("y"). ("ﾝ"))())
    ((("3"). ("ｱ"))())
    ((("e"). ("ｲ"))())
    ((("4"). ("ｳ"))())
    ((("5"). ("ｴ"))())
    ((("6"). ("ｵ"))())
    ((("t"). ("ｶ"))())
    ((("g"). ("ｷ"))())
    ((("h"). ("ｸ"))())
    (((":"). ("ｹ"))())
    ((("b"). ("ｺ"))())
    ((("x"). ("ｻ"))())
    ((("d"). ("ｼ"))())
    ((("r"). ("ｽ"))())
    ((("p"). ("ｾ"))())
    ((("c"). ("ｿ"))())
    ((("q"). ("ﾀ"))())
    ((("a"). ("ﾁ"))())
    ((("z"). ("ﾂ"))())
    ((("w"). ("ﾃ"))())
    ((("s"). ("ﾄ"))())
    ((("u"). ("ﾅ"))())
    ((("i"). ("ﾆ"))())
    ((("1"). ("ﾇ"))())
    (((","). ("ﾈ"))())
    ((("k"). ("ﾉ"))())
    ((("f"). ("ﾊ"))())
    ((("v"). ("ﾋ"))())
    ((("2"). ("ﾌ"))())
    ((("^"). ("ﾍ"))())
    ((("-"). ("ﾎ"))())
    ((("j"). ("ﾏ"))())
    ((("n"). ("ﾐ"))())
    ((("]"). ("ﾑ"))())
    ((("/"). ("ﾒ"))())
    ((("m"). ("ﾓ"))())
    ((("7"). ("ﾔ"))())
    ((("8"). ("ﾕ"))())
    ((("9"). ("ﾖ"))())
    ((("o"). ("ﾗ"))())
    ((("l"). ("ﾘ"))())
    ((("."). ("ﾙ"))())
    (((";"). ("ﾚ"))())
    ((("0"). ("ﾜ"))())
    ((("|"). ("ｰ"))())
    ((("T"). ("ｶ"))())
    ((("G"). ("ｷ"))())
    ((("H"). ("ｸ"))())
    ((("*"). ("ｹ"))())
    ((("B"). ("ｺ"))())
    ((("X"). ("ｻ"))())
    ((("D"). ("ｼ"))())
    ((("R"). ("ｽ"))())
    ((("P"). ("ｾ"))())
    ((("C"). ("ｿ"))())
    ((("Q"). ("ﾀ"))())
    ((("A"). ("ﾁ"))())
    ((("W"). ("ﾃ"))())
    ((("S"). ("ﾄ"))())
    ((("U"). ("ﾅ"))())
    ((("I"). ("ﾆ"))())
    ((("!"). ("ﾇ"))())
    ((("K"). ("ﾉ"))())
    ((("F"). ("ﾊ"))())
    ((("V"). ("ﾋ"))())
    ((("\""). ("ﾌ"))())
    ((("="). ("ﾎ"))())
    ((("J"). ("ﾏ"))())
    ((("N"). ("ﾐ"))())
    ((("M"). ("ﾓ"))())
    ((("O"). ("ﾗ"))())
    ((("L"). ("ﾘ"))())
    ((("+"). ("ﾚ"))())
    ((("_"). ("ﾛ"))())
    ((("Y"). ("ﾝ"))())
    ((("\\"). ("ﾛ"))())
    ((("yen"). ("ｰ"))())

    ((("kana-a"). ("ｧ"))())
    ((("kana-i"). ("ｨ"))())
    ((("kana-u"). ("ｩ"))())
    ((("kana-e"). ("ｪ"))())
    ((("kana-o"). ("ｫ"))())
    ((("kana-ya"). ("ｬ"))())
    ((("kana-yu"). ("ｭ"))())
    ((("kana-yo"). ("ｮ"))())
    ((("kana-WO"). ("ｦ"))())
    ((("kana-tsu"). ("ｯ"))())
    ((("kana-N"). ("ﾝ"))())
    ((("kana-A"). ("ｱ"))())
    ((("kana-I"). ("ｲ"))())
    ((("kana-U"). ("ｳ"))())
    ((("kana-E"). ("ｴ"))())
    ((("kana-O"). ("ｵ"))())
    ((("kana-KA"). ("ｶ"))())
    ((("kana-KI"). ("ｷ"))())
    ((("kana-KU"). ("ｸ"))())
    ((("kana-KE"). ("ｹ"))())
    ((("kana-KO"). ("ｺ"))())
    ((("kana-SA"). ("ｻ"))())
    ((("kana-SHI"). ("ｼ"))())
    ((("kana-SU"). ("ｽ"))())
    ((("kana-SE"). ("ｾ"))())
    ((("kana-SO"). ("ｿ"))())
    ((("kana-TA"). ("ﾀ"))())
    ((("kana-CHI"). ("ﾁ"))())
    ((("kana-TSU"). ("ﾂ"))())
    ((("kana-TE"). ("ﾃ"))())
    ((("kana-TO"). ("ﾄ"))())
    ((("kana-NA"). ("ﾅ"))())
    ((("kana-NI"). ("ﾆ"))())
    ((("kana-NU"). ("ﾇ"))())
    ((("kana-NE"). ("ﾈ"))())
    ((("kana-NO"). ("ﾉ"))())
    ((("kana-HA"). ("ﾊ"))())
    ((("kana-HI"). ("ﾋ"))())
    ((("kana-FU"). ("ﾌ"))())
    ((("kana-HE"). ("ﾍ"))())
    ((("kana-HO"). ("ﾎ"))())
    ((("kana-MA"). ("ﾏ"))())
    ((("kana-MI"). ("ﾐ"))())
    ((("kana-MU"). ("ﾑ"))())
    ((("kana-ME"). ("ﾒ"))())
    ((("kana-MO"). ("ﾓ"))())
    ((("kana-YA"). ("ﾔ"))())
    ((("kana-YU"). ("ﾕ"))())
    ((("kana-YO"). ("ﾖ"))())
    ((("kana-RA"). ("ﾗ"))())
    ((("kana-RI"). ("ﾘ"))())
    ((("kana-RU"). ("ﾙ"))())
    ((("kana-RE"). ("ﾚ"))())
    ((("kana-RO"). ("ﾛ"))())
    ((("kana-WA"). ("ﾜ"))())
    ((("kana-prolonged-sound"). ("ｰ"))())

    ((("ｶ" "@"). ())("ｶﾞ"))
    ((("ｷ" "@"). ())("ｷﾞ"))
    ((("ｸ" "@"). ())("ｸﾞ"))
    ((("ｹ" "@"). ())("ｹﾞ"))
    ((("ｺ" "@"). ())("ｺﾞ"))
    ((("ｻ" "@"). ())("ｻﾞ"))
    ((("ｼ" "@"). ())("ｼﾞ"))
    ((("ｽ" "@"). ())("ｽﾞ"))
    ((("ｾ" "@"). ())("ｾﾞ"))
    ((("ｿ" "@"). ())("ｿﾞ"))
    ((("ﾀ" "@"). ())("ﾀﾞ"))
    ((("ﾁ" "@"). ())("ﾁﾞ"))
    ((("ﾂ" "@"). ())("ﾂﾞ"))
    ((("ﾃ" "@"). ())("ﾃﾞ"))
    ((("ﾄ" "@"). ())("ﾄﾞ"))
    ((("ﾊ" "@"). ())("ﾊﾞ"))
    ((("ﾋ" "@"). ())("ﾋﾞ"))
    ((("ﾌ" "@"). ())("ﾌﾞ"))
    ((("ﾍ" "@"). ())("ﾍﾞ"))
    ((("ﾎ" "@"). ())("ﾎﾞ"))
    ((("ﾊ" "["). ())("ﾊﾟ"))
    ((("ﾋ" "["). ())("ﾋﾟ"))
    ((("ﾌ" "["). ())("ﾌﾟ"))
    ((("ﾍ" "["). ())("ﾍﾟ"))
    ((("ﾎ" "["). ())("ﾎﾟ"))
    ((("ｶ" "`"). ())("ｶﾞ"))
    ((("ｷ" "`"). ())("ｷﾞ"))
    ((("ｸ" "`"). ())("ｸﾞ"))
    ((("ｹ" "`"). ())("ｹﾞ"))
    ((("ｺ" "`"). ())("ｺﾞ"))
    ((("ｻ" "`"). ())("ｻﾞ"))
    ((("ｼ" "`"). ())("ｼﾞ"))
    ((("ｽ" "`"). ())("ｽﾞ"))
    ((("ｾ" "`"). ())("ｾﾞ"))
    ((("ｿ" "`"). ())("ｿﾞ"))
    ((("ﾀ" "`"). ())("ﾀﾞ"))
    ((("ﾁ" "`"). ())("ﾁﾞ"))
    ((("ﾂ" "`"). ())("ﾂﾞ"))
    ((("ﾃ" "`"). ())("ﾃﾞ"))
    ((("ﾄ" "`"). ())("ﾄﾞ"))
    ((("ﾊ" "`"). ())("ﾊﾞ"))
    ((("ﾋ" "`"). ())("ﾋﾞ"))
    ((("ﾌ" "`"). ())("ﾌﾞ"))
    ((("ﾍ" "`"). ())("ﾍﾞ"))
    ((("ﾎ" "`"). ())("ﾎﾞ"))

    ((("ｶ" "kana-voiced-sound"). ())("ｶﾞ"))
    ((("ｷ" "kana-voiced-sound"). ())("ｷﾞ"))
    ((("ｸ" "kana-voiced-sound"). ())("ｸﾞ"))
    ((("ｹ" "kana-voiced-sound"). ())("ｹﾞ"))
    ((("ｺ" "kana-voiced-sound"). ())("ｺﾞ"))
    ((("ｻ" "kana-voiced-sound"). ())("ｻﾞ"))
    ((("ｼ" "kana-voiced-sound"). ())("ｼﾞ"))
    ((("ｽ" "kana-voiced-sound"). ())("ｽﾞ"))
    ((("ｾ" "kana-voiced-sound"). ())("ｾﾞ"))
    ((("ｿ" "kana-voiced-sound"). ())("ｿﾞ"))
    ((("ﾀ" "kana-voiced-sound"). ())("ﾀﾞ"))
    ((("ﾁ" "kana-voiced-sound"). ())("ﾁﾞ"))
    ((("ﾂ" "kana-voiced-sound"). ())("ﾂﾞ"))
    ((("ﾃ" "kana-voiced-sound"). ())("ﾃﾞ"))
    ((("ﾄ" "kana-voiced-sound"). ())("ﾄﾞ"))
    ((("ﾊ" "kana-voiced-sound"). ())("ﾊﾞ"))
    ((("ﾋ" "kana-voiced-sound"). ())("ﾋﾞ"))
    ((("ﾌ" "kana-voiced-sound"). ())("ﾌﾞ"))
    ((("ﾍ" "kana-voiced-sound"). ())("ﾍﾞ"))
    ((("ﾎ" "kana-voiced-sound"). ())("ﾎﾞ"))
    ((("ﾊ" "kana-semivoiced-sound"). ())("ﾊﾟ"))
    ((("ﾋ" "kana-semivoiced-sound"). ())("ﾋﾟ"))
    ((("ﾌ" "kana-semivoiced-sound"). ())("ﾌﾟ"))
    ((("ﾍ" "kana-semivoiced-sound"). ())("ﾍﾟ"))
    ((("ﾎ" "kana-semivoiced-sound"). ())("ﾎﾟ"))
 
    (((">"). ("｡"))())
    ((("<"). ("､"))())
    ((("?"). ("･"))())
    ((("@"). ("ﾞ"))())
    ((("["). ("ﾟ"))())
    ((("{"). ("｢"))())
    ((("}"). ("｣"))())
    ((("`"). ("ﾞ"))())

    ((("kana-fullstop"). ("｡"))())
    ((("kana-comma"). ("､"))())
    ((("kana-conjunctive"). ("･"))())
    ((("kana-voiced-sound"). ("ﾞ"))())
    ((("kana-semivoiced-sound"). ("ﾟ"))())
    ((("kana-opening-bracket"). ("｢"))())
    ((("kana-closing-bracket"). ("｣"))())
 
    ((("ｧ"). ())("ｧ"))
    ((("ｨ"). ())("ｨ"))
    ((("ｩ"). ())("ｩ"))
    ((("ｪ"). ())("ｪ"))
    ((("ｫ"). ())("ｫ"))
    ((("ｬ"). ())("ﾔ"))
    ((("ｭ"). ())("ｭ"))
    ((("ｮ"). ())("ｮ"))
    ((("ｦ"). ())("ｦ"))
    ((("ｯ"). ())("ｯ"))
    ((("ﾝ"). ())("ﾝ"))
    ((("ｱ"). ())("ｱ"))
    ((("ｲ"). ())("ｲ"))
    ((("ｳ"). ())("ｳ"))
    ((("ｴ"). ())("ｴ"))
    ((("ｵ"). ())("ｵ"))
    ((("ｶ"). ())("ｶ"))
    ((("ｷ"). ())("ｷ"))
    ((("ｸ"). ())("ｸ"))
    ((("ｹ"). ())("ｹ"))
    ((("ｺ"). ())("ｺ"))
    ((("ｻ"). ())("ｻ"))
    ((("ｼ"). ())("ｼ"))
    ((("ｽ"). ())("ｽ"))
    ((("ｾ"). ())("ｾ"))
    ((("ｿ"). ())("ｿ"))
    ((("ﾀ"). ())("ﾀ"))
    ((("ﾁ"). ())("ﾁ"))
    ((("ﾂ"). ())("ﾂ"))
    ((("ﾃ"). ())("ﾃ"))
    ((("ﾄ"). ())("ﾄ"))
    ((("ﾅ"). ())("ﾅ"))
    ((("ﾆ"). ())("ﾆ"))
    ((("ﾇ"). ())("ﾇ"))
    ((("ﾈ"). ())("ﾈ"))
    ((("ﾉ"). ())("ﾉ"))
    ((("ﾊ"). ())("ﾊ"))
    ((("ﾋ"). ())("ﾋ"))
    ((("ﾌ"). ())("ﾌ"))
    ((("ﾍ"). ())("ﾍ"))
    ((("ﾎ"). ())("ﾎ"))
    ((("ﾏ"). ())("ﾏ"))
    ((("ﾐ"). ())("ﾐ"))
    ((("ﾑ"). ())("ﾑ"))
    ((("ﾒ"). ())("ﾒ"))
    ((("ﾓ"). ())("ﾓ"))
    ((("ﾔ"). ())("ﾔ"))
    ((("ﾕ"). ())("ﾕ"))
    ((("ﾖ"). ())("ﾖ"))
    ((("ﾗ"). ())("ﾗ"))
    ((("ﾘ"). ())("ﾘ"))
    ((("ﾙ"). ())("ﾙ"))
    ((("ﾚ"). ())("ﾚ"))
    ((("ﾛ"). ())("ﾛ"))
    ((("ﾜ"). ())("ﾜ"))
    ((("ｰ"). ())("ｰ"))
    ((("｡"). ())("｡"))
    ((("､"). ())("､"))
    ((("･"). ())("･"))
    ((("ﾞ"). ())("ﾞ"))
    ((("ﾟ"). ())("ﾟ"))
    ((("｢"). ())("｢"))
    ((("｣"). ())("｣"))
    ))
