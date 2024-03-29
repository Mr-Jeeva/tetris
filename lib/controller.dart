import 'package:flutter/material.dart';

class GridModel {
  bool occupied = false;
  Color color = Colors.black54;
  int? id;

  GridModel({required this.occupied, required this.color, required this.id});

  setColor(Color col) {
    this.color = col;
  }
  setOccupied(bool occ) {
    this.occupied = occ;
  }
}

class Grid {
  List<GridModel> gridModel = [
    GridModel(occupied: false, color: Colors.black12, id: 1),
    GridModel(occupied: false, color: Colors.black12, id: 2),
    GridModel(occupied: false, color: Colors.black12, id: 3),
    GridModel(occupied: false, color: Colors.black12, id: 4),
    GridModel(occupied: false, color: Colors.black12, id: 5),
    GridModel(occupied: false, color: Colors.black12, id: 6),
    GridModel(occupied: false, color: Colors.black12, id: 7),
    GridModel(occupied: false, color: Colors.black12, id: 8),
    GridModel(occupied: false, color: Colors.black12, id: 9),
    GridModel(occupied: false, color: Colors.black12, id: 10),
    GridModel(occupied: false, color: Colors.black12, id: 11),
    GridModel(occupied: false, color: Colors.black12, id: 12),
    GridModel(occupied: false, color: Colors.black12, id: 13),
    GridModel(occupied: false, color: Colors.black12, id: 14),
    GridModel(occupied: false, color: Colors.black12, id: 15),
    GridModel(occupied: false, color: Colors.black12, id: 16),
    GridModel(occupied: false, color: Colors.black12, id: 17),
    GridModel(occupied: false, color: Colors.black12, id: 18),
    GridModel(occupied: false, color: Colors.black12, id: 19),
    GridModel(occupied: false, color: Colors.black12, id: 20),
    GridModel(occupied: false, color: Colors.black12, id: 21),
    GridModel(occupied: false, color: Colors.black12, id: 22),
    GridModel(occupied: false, color: Colors.black12, id: 23),
    GridModel(occupied: false, color: Colors.black12, id: 24),
    GridModel(occupied: false, color: Colors.black12, id: 25),
    GridModel(occupied: false, color: Colors.black12, id: 26),
    GridModel(occupied: false, color: Colors.black12, id: 27),
    GridModel(occupied: false, color: Colors.black12, id: 28),
    GridModel(occupied: false, color: Colors.black12, id: 29),
    GridModel(occupied: false, color: Colors.black12, id: 30),
    GridModel(occupied: false, color: Colors.black12, id: 31),
    GridModel(occupied: false, color: Colors.black12, id: 32),
    GridModel(occupied: false, color: Colors.black12, id: 33),
    GridModel(occupied: false, color: Colors.black12, id: 34),
    GridModel(occupied: false, color: Colors.black12, id: 35),
    GridModel(occupied: false, color: Colors.black12, id: 36),
    GridModel(occupied: false, color: Colors.black12, id: 37),
    GridModel(occupied: false, color: Colors.black12, id: 38),
    GridModel(occupied: false, color: Colors.black12, id: 39),
    GridModel(occupied: false, color: Colors.black12, id: 40),
    GridModel(occupied: false, color: Colors.black12, id: 41),
    GridModel(occupied: false, color: Colors.black12, id: 42),
    GridModel(occupied: false, color: Colors.black12, id: 43),
    GridModel(occupied: false, color: Colors.black12, id: 44),
    GridModel(occupied: false, color: Colors.black12, id: 45),
    GridModel(occupied: false, color: Colors.black12, id: 46),
    GridModel(occupied: false, color: Colors.black12, id: 47),
    GridModel(occupied: false, color: Colors.black12, id: 48),
    GridModel(occupied: false, color: Colors.black12, id: 49),
    GridModel(occupied: false, color: Colors.black12, id: 50),
    GridModel(occupied: false, color: Colors.black12, id: 51),
    GridModel(occupied: false, color: Colors.black12, id: 52),
    GridModel(occupied: false, color: Colors.black12, id: 53),
    GridModel(occupied: false, color: Colors.black12, id: 54),
    GridModel(occupied: false, color: Colors.black12, id: 55),
    GridModel(occupied: false, color: Colors.black12, id: 56),
    GridModel(occupied: false, color: Colors.black12, id: 57),
    GridModel(occupied: false, color: Colors.black12, id: 58),
    GridModel(occupied: false, color: Colors.black12, id: 59),
    GridModel(occupied: false, color: Colors.black12, id: 60),
    GridModel(occupied: false, color: Colors.black12, id: 61),
    GridModel(occupied: false, color: Colors.black12, id: 62),
    GridModel(occupied: false, color: Colors.black12, id: 63),
    GridModel(occupied: false, color: Colors.black12, id: 64),
    GridModel(occupied: false, color: Colors.black12, id: 65),
    GridModel(occupied: false, color: Colors.black12, id: 66),
    GridModel(occupied: false, color: Colors.black12, id: 67),
    GridModel(occupied: false, color: Colors.black12, id: 68),
    GridModel(occupied: false, color: Colors.black12, id: 69),
    GridModel(occupied: false, color: Colors.black12, id: 70),
    GridModel(occupied: false, color: Colors.black12, id: 71),
    GridModel(occupied: false, color: Colors.black12, id: 72),
    GridModel(occupied: false, color: Colors.black12, id: 73),
    GridModel(occupied: false, color: Colors.black12, id: 74),
    GridModel(occupied: false, color: Colors.black12, id: 75),
    GridModel(occupied: false, color: Colors.black12, id: 76),
    GridModel(occupied: false, color: Colors.black12, id: 77),
    GridModel(occupied: false, color: Colors.black12, id: 78),
    GridModel(occupied: false, color: Colors.black12, id: 79),
    GridModel(occupied: false, color: Colors.black12, id: 80),
    GridModel(occupied: false, color: Colors.black12, id: 81),
    GridModel(occupied: false, color: Colors.black12, id: 82),
    GridModel(occupied: false, color: Colors.black12, id: 83),
    GridModel(occupied: false, color: Colors.black12, id: 84),
    GridModel(occupied: false, color: Colors.black12, id: 85),
    GridModel(occupied: false, color: Colors.black12, id: 86),
    GridModel(occupied: false, color: Colors.black12, id: 87),
    GridModel(occupied: false, color: Colors.black12, id: 88),
    GridModel(occupied: false, color: Colors.black12, id: 89),
    GridModel(occupied: false, color: Colors.black12, id: 90),
    GridModel(occupied: false, color: Colors.black12, id: 91),
    GridModel(occupied: false, color: Colors.black12, id: 92),
    GridModel(occupied: false, color: Colors.black12, id: 93),
    GridModel(occupied: false, color: Colors.black12, id: 94),
    GridModel(occupied: false, color: Colors.black12, id: 95),
    GridModel(occupied: false, color: Colors.black12, id: 96),
    GridModel(occupied: false, color: Colors.black12, id: 97),
    GridModel(occupied: false, color: Colors.black12, id: 98),
    GridModel(occupied: false, color: Colors.black12, id: 99),
    GridModel(occupied: false, color: Colors.black12, id: 100),
    GridModel(occupied: false, color: Colors.black12, id: 101),
    GridModel(occupied: false, color: Colors.black12, id: 102),
    GridModel(occupied: false, color: Colors.black12, id: 103),
    GridModel(occupied: false, color: Colors.black12, id: 104),
    GridModel(occupied: false, color: Colors.black12, id: 105),
    GridModel(occupied: false, color: Colors.black12, id: 106),
    GridModel(occupied: false, color: Colors.black12, id: 107),
    GridModel(occupied: false, color: Colors.black12, id: 108),
    GridModel(occupied: false, color: Colors.black12, id: 109),
    GridModel(occupied: false, color: Colors.black12, id: 110),
    GridModel(occupied: false, color: Colors.black12, id: 111),
    GridModel(occupied: false, color: Colors.black12, id: 112),
    GridModel(occupied: false, color: Colors.black12, id: 113),
    GridModel(occupied: false, color: Colors.black12, id: 114),
    GridModel(occupied: false, color: Colors.black12, id: 115),
    GridModel(occupied: false, color: Colors.black12, id: 116),
    GridModel(occupied: false, color: Colors.black12, id: 117),
    GridModel(occupied: false, color: Colors.black12, id: 118),
    GridModel(occupied: false, color: Colors.black12, id: 119),
    GridModel(occupied: false, color: Colors.black12, id: 120),
    GridModel(occupied: false, color: Colors.black12, id: 121),
    GridModel(occupied: false, color: Colors.black12, id: 122),
    GridModel(occupied: false, color: Colors.black12, id: 123),
    GridModel(occupied: false, color: Colors.black12, id: 124),
    GridModel(occupied: false, color: Colors.black12, id: 125),
    GridModel(occupied: false, color: Colors.black12, id: 126),
    GridModel(occupied: false, color: Colors.black12, id: 127),
    GridModel(occupied: false, color: Colors.black12, id: 128),
    GridModel(occupied: false, color: Colors.black12, id: 129),
    GridModel(occupied: false, color: Colors.black12, id: 130),
    GridModel(occupied: false, color: Colors.black12, id: 131),
    GridModel(occupied: false, color: Colors.black12, id: 132),
    GridModel(occupied: false, color: Colors.black12, id: 133),
    GridModel(occupied: false, color: Colors.black12, id: 134),
    GridModel(occupied: false, color: Colors.black12, id: 135),
    GridModel(occupied: false, color: Colors.black12, id: 136),
    GridModel(occupied: false, color: Colors.black12, id: 137),
    GridModel(occupied: false, color: Colors.black12, id: 138),
    GridModel(occupied: false, color: Colors.black12, id: 139),
    GridModel(occupied: false, color: Colors.black12, id: 140),
    GridModel(occupied: false, color: Colors.black12, id: 141),
    GridModel(occupied: false, color: Colors.black12, id: 142),
    GridModel(occupied: false, color: Colors.black12, id: 143),
    GridModel(occupied: false, color: Colors.black12, id: 144),
    GridModel(occupied: false, color: Colors.black12, id: 145),
    GridModel(occupied: false, color: Colors.black12, id: 146),
    GridModel(occupied: false, color: Colors.black12, id: 147),
    GridModel(occupied: false, color: Colors.black12, id: 148),
    GridModel(occupied: false, color: Colors.black12, id: 149),
    GridModel(occupied: false, color: Colors.black12, id: 150),
    GridModel(occupied: false, color: Colors.black12, id: 151),
    GridModel(occupied: false, color: Colors.black12, id: 152),
    GridModel(occupied: false, color: Colors.black12, id: 153),
    GridModel(occupied: false, color: Colors.black12, id: 154),
    GridModel(occupied: false, color: Colors.black12, id: 155),
    GridModel(occupied: false, color: Colors.black12, id: 156),
    GridModel(occupied: false, color: Colors.black12, id: 157),
    GridModel(occupied: false, color: Colors.black12, id: 158),
    GridModel(occupied: false, color: Colors.black12, id: 159),
    GridModel(occupied: false, color: Colors.black12, id: 160),
    GridModel(occupied: false, color: Colors.black12, id: 161),
    GridModel(occupied: false, color: Colors.black12, id: 162),
    GridModel(occupied: false, color: Colors.black12, id: 163),
    GridModel(occupied: false, color: Colors.black12, id: 164),
    GridModel(occupied: false, color: Colors.black12, id: 165),
    GridModel(occupied: false, color: Colors.black12, id: 166),
    GridModel(occupied: false, color: Colors.black12, id: 167),
    GridModel(occupied: false, color: Colors.black12, id: 168),
    GridModel(occupied: false, color: Colors.black12, id: 169),
    GridModel(occupied: false, color: Colors.black12, id: 170),
    GridModel(occupied: false, color: Colors.black12, id: 171),
    GridModel(occupied: false, color: Colors.black12, id: 172),
    GridModel(occupied: false, color: Colors.black12, id: 173),
    GridModel(occupied: false, color: Colors.black12, id: 174),
    GridModel(occupied: false, color: Colors.black12, id: 175),
    GridModel(occupied: false, color: Colors.black12, id: 176),
    GridModel(occupied: false, color: Colors.black12, id: 177),
    GridModel(occupied: false, color: Colors.black12, id: 178),
    GridModel(occupied: false, color: Colors.black12, id: 179),
    GridModel(occupied: false, color: Colors.black12, id: 180),
    GridModel(occupied: false, color: Colors.black12, id: 181),
    GridModel(occupied: false, color: Colors.black12, id: 182),
    GridModel(occupied: false, color: Colors.black12, id: 183),
    GridModel(occupied: false, color: Colors.black12, id: 184),
    GridModel(occupied: false, color: Colors.black12, id: 185),
    GridModel(occupied: false, color: Colors.black12, id: 186),
    GridModel(occupied: false, color: Colors.black12, id: 187),
    GridModel(occupied: false, color: Colors.black12, id: 188),
    GridModel(occupied: false, color: Colors.black12, id: 189),
    GridModel(occupied: false, color: Colors.black12, id: 190),
    GridModel(occupied: false, color: Colors.black12, id: 191),
    GridModel(occupied: false, color: Colors.black12, id: 192),
    GridModel(occupied: false, color: Colors.black12, id: 193),
    GridModel(occupied: false, color: Colors.black12, id: 194),
    GridModel(occupied: false, color: Colors.black12, id: 195),
    GridModel(occupied: false, color: Colors.black12, id: 196),
    GridModel(occupied: false, color: Colors.black12, id: 197),
    GridModel(occupied: false, color: Colors.black12, id: 198),
    GridModel(occupied: false, color: Colors.black12, id: 199),
    GridModel(occupied: false, color: Colors.black12, id: 200),
  ];

}