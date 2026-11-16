extends Node

var lives := 3
var isGameOver := false
var lvlIndex := 0

const loseMsgs: Array[String] = [
	'Come on!',
	'You can do it!',
	'Ooof, not good',
	'Close one!',
	'Woof...',
	'What was that??',
	'I believe in you!',
	'...Okay...',
	'Yay, an attempt!',
	'Really good try',
	'Do better',
	';-P',
	'Don\'t give up!'
]

const lvls := [
	[
		'SSSSSSSSS',
		'SSSSSSSSS',
		'SSSSSSSSS',
		'SSSSSSSSS',
		'SSSSSSSSS',
		'SSSSSSSSS',
		'SSSSSSSSS',
		'SSSSSSSSS',
	],
	[
		'OO-----OO',
		'---------',
		'BBBOOBBBB',
		'OOOBBBOOO',
		'OOO---OOO',
		'BHO--SOO-',
		'---------',
		'OO-----OO',
	],
	[
		'---------',
		'---------',
		'BBBOOBBBB',
		'OOOBBBOOO',
		'BBBBBBBBB',
		'----S----',
		'---------',
		'---------',
	],
	[
		'---------',
		'---------',
		'BBBOOBBBB',
		'OOOOOOOOO',
		'OOHBOBHOO',
		'---------',
		'---------',
		'---------',
	],
	[
		'--OOOOO--',
		'O-----OOO',
		'HHHOOBHHH',
		'OOOOOOOOO',
		'OOHBOBHOO',
		'OOOOHHOOO',
		'OOHHB--OO',
		'--OBBOO--',
	],
	[
		'OOOOOOOOO',
		'OOOOOOOOO',
		'OOOOOOOOO',
		'OOOOOOOOO',
		'OOOOOOOOO',
		'OOOOOOOOO',
		'OOOOOOOOO',
		'OOOBBOOOO',
	],
	[
		'---------',
		'---------',
		'---------',
		'----BBO--',
		'----B----',
		'---------',
		'---------',
		'---------',
	],
	[
		'BBBBBBBBB',
		'BBBBBBBBB',
		'BBBBBBBBB',
		'BBBBOBBBB',
		'BBBBBBBBB',
		'BBBBBBBBB',
		'BOOOBOOOB',
		'BBBBBBBBB',
	]
]

var lastLvlIndex := lvls.size() - 1

func isWin() -> bool:
	return lvlIndex > lastLvlIndex
