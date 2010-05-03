-- this version has been manually edited
-- rather then generated by the ruby script
return {
    -- BEGIN manual additions
	["english"]={
		loader="hyphen.tex",
        special=0, -- should be dumped in the format
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={"usenglish","USenglish","american"},
	},
    ["nohyphenation"] = {
        loader = 'zerohyph.tex',
        special = 'null', -- no pattern nor exceptions
		synonyms={},
    },
    ["arabic"] = {
        loader = 'zerohyph.tex',
        special = 'null',
		synonyms={},
    },
    ["farsi"] = {
        loader = 'zerohyph.tex',
        special = 'null',
        synonyms = {'persian'},
    },
    -- final decision not made yet
    -- [[
    ["german-x-2009-06-19"] = {
        loader = 'zerohyph.tex',
        special = 'disabled:experimental',
        synonyms = {'german-x-latest'},
    },
    ["ngerman-x-2009-06-19"] = {
        loader = 'zerohyph.tex',
        special = 'disabled:experimental',
        synonyms = {'ngerman-x-latest'},
    },
    --]]
    -- uncoment the following block to disable ibycus and mongolianmlc
    -- (but please provide a reason)
    --[[
    ["ibycus"] = {
        loader = 'ibyhyph.tex',
        special = 'disabled:why?',
        synonyms = {},
    },
    ["monglianmlc"] = {
        loader = 'loadhyph-mn-cyrl-x-lmc.tex',
        special = 'disabled:why?',
        synonyms = {},
    },
    -]]
    -- END manual additions
	["assamese"]={
		loader="loadhyph-as.tex",
		patterns="hyph-as.pat.txt",
		hyphenation="hyph-as.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["bulgarian"]={
		loader="loadhyph-bg.tex",
		patterns="hyph-bg.pat.txt",
		hyphenation="hyph-bg.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["bengali"]={
		loader="loadhyph-bn.tex",
		patterns="hyph-bn.pat.txt",
		hyphenation="hyph-bn.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["catalan"]={
		loader="loadhyph-ca.tex",
		patterns="hyph-ca.pat.txt",
		hyphenation="hyph-ca.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["coptic"]={
		loader="loadhyph-cop.tex",
		patterns="hyph-cop.pat.txt",
		hyphenation="hyph-cop.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["czech"]={
		loader="loadhyph-cs.tex",
		patterns="hyph-cs.pat.txt",
		hyphenation="hyph-cs.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={},
	},
	["welsh"]={
		loader="loadhyph-cy.tex",
		patterns="hyph-cy.pat.txt",
		hyphenation="hyph-cy.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={},
	},
	["danish"]={
		loader="loadhyph-da.tex",
		patterns="hyph-da.pat.txt",
		hyphenation="hyph-da.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["german"]={
		loader="loadhyph-de-1901.tex",
		patterns="hyph-de-1901.pat.txt",
		hyphenation="hyph-de-1901.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["ngerman"]={
		loader="loadhyph-de-1996.tex",
		patterns="hyph-de-1996.pat.txt",
		hyphenation="hyph-de-1996.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["swissgerman"]={
		loader="loadhyph-de-ch-1901.tex",
		patterns="hyph-de-CH-1901.pat.txt",
		hyphenation="hyph-de-CH-1901.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["monogreek"]={
		loader="loadhyph-el-monoton.tex",
		patterns="hyph-el-monoton.pat.txt",
		hyphenation="hyph-el-monoton.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["greek"]={
		loader="loadhyph-el-polyton.tex",
		patterns="hyph-el-polyton.pat.txt",
		hyphenation="hyph-el-polyton.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={"polygreek"},
	},
	["ukenglish"]={
		loader="loadhyph-en-gb.tex",
		patterns="hyph-en-GB.pat.txt",
		hyphenation="hyph-en-GB.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={"british","UKenglish"},
	},
	["usenglishmax"]={
		loader="ushyphmax.tex",
		patterns="hyph-en-US.pat.txt",
		hyphenation="hyph-en-US.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={},
	},
	["esperanto"]={
		loader="loadhyph-eo.tex",
		patterns="hyph-eo.pat.txt",
		hyphenation="hyph-eo.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["spanish"]={
		loader="loadhyph-es.tex",
		patterns="hyph-es.pat.txt",
		hyphenation="hyph-es.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={"espanol"},
	},
	["estonian"]={
		loader="loadhyph-et.tex",
		patterns="hyph-et.pat.txt",
		hyphenation="hyph-et.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={},
	},
	["basque"]={
		loader="loadhyph-eu.tex",
		patterns="hyph-eu.pat.txt",
		hyphenation="hyph-eu.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["finnish"]={
		loader="loadhyph-fi.tex",
		patterns="hyph-fi.pat.txt",
		hyphenation="hyph-fi.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["french"]={
		loader="loadhyph-fr.tex",
		patterns="hyph-fr.pat.txt",
		hyphenation="hyph-fr.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={"patois","francais"},
	},
	["irish"]={
		loader="loadhyph-ga.tex",
		patterns="hyph-ga.pat.txt",
		hyphenation="hyph-ga.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={},
	},
	["galician"]={
		loader="loadhyph-gl.tex",
		patterns="hyph-gl.pat.txt",
		hyphenation="hyph-gl.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["ancientgreek"]={
		loader="loadhyph-grc.tex",
		patterns="hyph-grc.pat.txt",
		hyphenation="hyph-grc.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["gujarati"]={
		loader="loadhyph-gu.tex",
		patterns="hyph-gu.pat.txt",
		hyphenation="hyph-gu.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["hindi"]={
		loader="loadhyph-hi.tex",
		patterns="hyph-hi.pat.txt",
		hyphenation="hyph-hi.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["croatian"]={
		loader="loadhyph-hr.tex",
		patterns="hyph-hr.pat.txt",
		hyphenation="hyph-hr.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["uppersorbian"]={
		loader="loadhyph-hsb.tex",
		patterns="hyph-hsb.pat.txt",
		hyphenation="hyph-hsb.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["hungarian"]={
		loader="loadhyph-hu.tex",
		patterns="hyph-hu.pat.txt",
		hyphenation="hyph-hu.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["interlingua"]={
		loader="loadhyph-ia.tex",
		patterns="hyph-ia.pat.txt",
		hyphenation="hyph-ia.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["indonesian"]={
		loader="loadhyph-id.tex",
		patterns="hyph-id.pat.txt",
		hyphenation="hyph-id.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["icelandic"]={
		loader="loadhyph-is.tex",
		patterns="hyph-is.pat.txt",
		hyphenation="hyph-is.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["italian"]={
		loader="loadhyph-it.tex",
		patterns="hyph-it.pat.txt",
		hyphenation="hyph-it.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["kurmanji"]={
		loader="loadhyph-kmr.tex",
		patterns="hyph-kmr.pat.txt",
		hyphenation="hyph-kmr.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["kannada"]={
		loader="loadhyph-kn.tex",
		patterns="hyph-kn.pat.txt",
		hyphenation="hyph-kn.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["latin"]={
		loader="loadhyph-la.tex",
		patterns="hyph-la.pat.txt",
		hyphenation="hyph-la.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["lithuanian"]={
		loader="loadhyph-lt.tex",
		patterns="hyph-lt.pat.txt",
		hyphenation="hyph-lt.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["latvian"]={
		loader="loadhyph-lv.tex",
		patterns="hyph-lv.pat.txt",
		hyphenation="hyph-lv.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["malayalam"]={
		loader="loadhyph-ml.tex",
		patterns="hyph-ml.pat.txt",
		hyphenation="hyph-ml.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["mongolian"]={
		loader="loadhyph-mn-cyrl.tex",
		patterns="hyph-mn.pat.txt",
		hyphenation="hyph-mn.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["marathi"]={
		loader="loadhyph-mr.tex",
		patterns="hyph-mr.pat.txt",
		hyphenation="hyph-mr.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["bokmal"]={
		loader="loadhyph-nb.tex",
		patterns="hyph-nb.pat.txt",
		hyphenation="hyph-nb.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={"norwegian","norsk"},
	},
	["dutch"]={
		loader="loadhyph-nl.tex",
		patterns="hyph-nl.pat.txt",
		hyphenation="hyph-nl.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["nynorsk"]={
		loader="loadhyph-nn.tex",
		patterns="hyph-nn.pat.txt",
		hyphenation="hyph-nn.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["oriya"]={
		loader="loadhyph-or.tex",
		patterns="hyph-or.pat.txt",
		hyphenation="hyph-or.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["panjabi"]={
		loader="loadhyph-pa.tex",
		patterns="hyph-pa.pat.txt",
		hyphenation="hyph-pa.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["polish"]={
		loader="loadhyph-pl.tex",
		patterns="hyph-pl.pat.txt",
		hyphenation="hyph-pl.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["portuguese"]={
		loader="loadhyph-pt.tex",
		patterns="hyph-pt.pat.txt",
		hyphenation="hyph-pt.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={"portuges"},
	},
	["romanian"]={
		loader="loadhyph-ro.tex",
		patterns="hyph-ro.pat.txt",
		hyphenation="hyph-ro.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["russian"]={
		loader="loadhyph-ru.tex",
		patterns="hyph-ru.pat.txt",
		hyphenation="hyph-ru.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["sanskrit"]={
		loader="loadhyph-sa.tex",
		patterns="hyph-sa.pat.txt",
		hyphenation="hyph-sa.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=5,
		synonyms={},
	},
	["serbian"]={
		loader="loadhyph-sh-latn.tex",
		patterns="hyph-sr-Latn.pat.txt",
		hyphenation="hyph-sr-Latn.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["slovak"]={
		loader="loadhyph-sk.tex",
		patterns="hyph-sk.pat.txt",
		hyphenation="hyph-sk.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={},
	},
	["slovenian"]={
		loader="loadhyph-sl.tex",
		patterns="hyph-sl.pat.txt",
		hyphenation="hyph-sl.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={"slovene"},
	},
	["serbianc"]={
		loader="loadhyph-sr-cyrl.tex",
		patterns="hyph-sr-Cyrl.pat.txt",
		hyphenation="hyph-sr-Cyrl.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["swedish"]={
		loader="loadhyph-sv.tex",
		patterns="hyph-sv.pat.txt",
		hyphenation="hyph-sv.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["tamil"]={
		loader="loadhyph-ta.tex",
		patterns="hyph-ta.pat.txt",
		hyphenation="hyph-ta.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["telugu"]={
		loader="loadhyph-te.tex",
		patterns="hyph-te.pat.txt",
		hyphenation="hyph-te.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
	["turkmen"]={
		loader="loadhyph-tk.tex",
		patterns="hyph-tk.pat.txt",
		hyphenation="hyph-tk.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["turkish"]={
		loader="loadhyph-tr.tex",
		patterns="hyph-tr.pat.txt",
		hyphenation="hyph-tr.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["ukrainian"]={
		loader="loadhyph-uk.tex",
		patterns="hyph-uk.pat.txt",
		hyphenation="hyph-uk.hyp.txt",
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={},
	},
	["pinyin"]={
		loader="loadhyph-zh-latn.tex",
		patterns="hyph-zh-Latn.pat.txt",
		hyphenation="hyph-zh-Latn.hyp.txt",
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={},
	},
}
