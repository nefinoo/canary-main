-- Random Outfit System - Canary RevScript
-- IDs bloqueados: escaneo 2..2207, monturas, outfits de jugadores y exclusiones originales.
-- Los IDs sin warning no garantizan una apariencia visual correcta.
local randomOutfit = Action()

local config = {
    tokenId = 52583,
    tokenCost = 1500,
    uniqueId = 1000,
    minLookType = 2,
    maxLookType = 2207
}

local blocked = {}

-- Advertencias de Canary registradas en el escaneo
local blockedFromScan = {
    135, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173,
    174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187,
    188, 189, 190, 191, 411, 415, 424, 439, 440, 468, 469, 474, 475, 476,
    477, 478, 479, 480, 481, 482, 483, 484, 485, 501, 518, 519, 520, 524,
    525, 536, 543, 549, 581, 582, 597, 616, 623, 625, 638, 639, 640, 641,
    642, 643, 645, 646, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661,
    662, 663, 678, 700, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710,
    711, 713, 715, 718, 719, 722, 723, 737, 741, 742, 743, 744, 748, 751,
    752, 753, 754, 755, 756, 757, 758, 764, 765, 766, 767, 768, 769, 770,
    771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784,
    785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796, 797, 798,
    799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812,
    813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826,
    827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840,
    841, 847, 861, 864, 865, 866, 867, 871, 872, 880, 891, 892, 893, 894,
    895, 896, 897, 898, 911, 912, 917, 930, 941, 942, 946, 953, 954, 983,
    995, 996, 997, 998, 999, 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008,
    1009, 1010, 1012, 1014, 1022, 1028, 1074, 1075, 1080, 1081, 1082, 1083, 1084, 1085,
    1086, 1087, 1089, 1090, 1096, 1097, 1098, 1099, 1100, 1141, 1145, 1153, 1154, 1155,
    1156, 1160, 1170, 1171, 1172, 1176, 1177, 1178, 1182, 1192, 1193, 1194, 1198, 1215,
    1216, 1225, 1226, 1227, 1228, 1235, 1236, 1237, 1238, 1239, 1240, 1241, 1242, 1250,
    1254, 1263, 1267, 1273, 1274, 1287, 1302, 1318, 1319, 1320, 1327, 1328, 1329, 1330,
    1340, 1343, 1345, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1354, 1355, 1356, 1357,
    1358, 1359, 1360, 1361, 1362, 1368, 1369, 1370, 1374, 1375, 1376, 1388, 1392, 1395,
    1400, 1402, 1404, 1409, 1410, 1411, 1420, 1421, 1427, 1428, 1429, 1432, 1433, 1434,
    1435, 1438, 1442, 1443, 1451, 1452, 1458, 1462, 1470, 1471, 1472, 1473, 1474, 1475,
    1476, 1477, 1478, 1479, 1480, 1481, 1482, 1483, 1484, 1485, 1486, 1487, 1488, 1494,
    1495, 1496, 1497, 1498, 1499, 1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510,
    1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1519, 1520, 1521, 1522, 1523, 1524,
    1525, 1529, 1530, 1531, 1532, 1544, 1545, 1563, 1564, 1571, 1572, 1573, 1574, 1583,
    1607, 1614, 1629, 1630, 1631, 1633, 1634, 1635, 1636, 1637, 1638, 1639, 1650, 1651,
    1667, 1678, 1679, 1690, 1691, 1704, 1705, 1706, 1711, 1715, 1731, 1734, 1736, 1748,
    1761, 1779, 1781, 1782, 1783, 1784, 1785, 1786, 1787, 1788, 1789, 1790, 1791, 1805,
    1806, 1807, 1816, 1817, 1818, 1819, 1820, 1821, 1822, 1823, 1824, 1825, 1829,
}
for _, id in ipairs(blockedFromScan) do
    blocked[id] = true
end

-- Exclusiones originales, aunque Canary no las haya rechazado
local originalExcludedIds = {75, 266, 302}
for _, id in ipairs(originalExcludedIds) do
    blocked[id] = true
end

local originalExcludedRanges = {
    {128, 158}, {161, 191}, {267, 273}, {278, 279},
    {288, 289}, {324, 325}, {327, 329}, {251, 252}
}
for _, range in ipairs(originalExcludedRanges) do
    for id = range[1], range[2] do
        blocked[id] = true
    end
end

-- Monturas extraidas del XML proporcionado (atributo clientid)
local blockedMounts = {
    368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 387, 388,
    389, 390, 392, 401, 402, 405, 406, 421, 426, 427, 437, 438, 447, 450,
    502, 503, 506, 515, 521, 522, 526, 546, 547, 548, 559, 571, 572, 580,
    606, 621, 622, 624, 626, 627, 628, 629, 630, 631, 644, 647, 648, 649,
    650, 651, 669, 670, 671, 672, 673, 674, 682, 685, 686, 687, 688, 689,
    690, 691, 692, 693, 726, 727, 728, 734, 735, 736, 738, 739, 740, 761,
    762, 763, 848, 849, 850, 851, 868, 869, 870, 883, 886, 887, 888, 889,
    890, 901, 902, 903, 905, 906, 907, 937, 950, 951, 952, 959, 960, 961,
    1017, 1018, 1019, 1025, 1026, 1027, 1049, 1052, 1053, 1054, 1091, 1092, 1093, 1101,
    1104, 1105, 1106, 1150, 1151, 1163, 1164, 1165, 1167, 1168, 1169, 1179, 1180, 1181,
    1183, 1184, 1185, 1191, 1208, 1209, 1229, 1230, 1231, 1232, 1233, 1234, 1247, 1248,
    1249, 1257, 1258, 1259, 1264, 1265, 1266, 1269, 1281, 1284, 1285, 1286, 1321, 1324,
    1325, 1326, 1333, 1334, 1335, 1336, 1363, 1379, 1380, 1381, 1389, 1390, 1391, 1417,
    1430, 1431, 1439, 1440, 1441, 1446, 1447, 1448, 1453, 1454, 1455, 1459, 1491, 1492,
    1493, 1526, 1527, 1528, 1536, 1577, 1578, 1579, 1580, 1599, 1608, 1609, 1610, 1615,
    1616, 1617, 1632, 1672, 1673, 1674, 1677, 1682, 1685, 1686, 1687, 1721, 1724, 1727,
    1728, 1729, 1730, 1742, 1743, 1744, 1778, 1810, 1833, 1834, 1835,
}
for _, id in ipairs(blockedMounts) do
    blocked[id] = true
end

-- Outfits de jugadores extraidos del XML (masculinos y femeninos)
local blockedPlayerOutfits = {
    128, 129, 130, 131, 132, 133, 134, 136, 137, 138, 139, 140, 141, 142,
    143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156,
    157, 158, 251, 252, 268, 269, 270, 273, 278, 279, 288, 289, 324, 325,
    328, 329, 335, 336, 366, 367, 430, 431, 432, 433, 463, 464, 465, 466,
    471, 472, 512, 513, 514, 516, 541, 542, 574, 575, 577, 578, 610, 618,
    619, 620, 632, 633, 634, 635, 636, 637, 664, 665, 666, 667, 683, 684,
    694, 695, 696, 697, 698, 699, 724, 725, 732, 733, 745, 746, 749, 750,
    759, 760, 845, 846, 852, 853, 873, 874, 884, 885, 899, 900, 908, 909,
    929, 931, 955, 956, 957, 958, 962, 963, 964, 965, 966, 967, 968, 969,
    970, 971, 972, 973, 974, 975, 1020, 1021, 1023, 1024, 1042, 1043, 1050, 1051,
    1056, 1057, 1069, 1070, 1094, 1095, 1102, 1103, 1127, 1128, 1146, 1147, 1161, 1162,
    1173, 1174, 1186, 1187, 1202, 1203, 1204, 1205, 1206, 1207, 1210, 1211, 1243, 1244,
    1245, 1246, 1251, 1252, 1270, 1271, 1279, 1280, 1282, 1283, 1288, 1289, 1292, 1293,
    1322, 1323, 1331, 1332, 1338, 1339, 1371, 1372, 1382, 1383, 1384, 1385, 1386, 1387,
    1415, 1416, 1436, 1437, 1444, 1445, 1449, 1450, 1456, 1457, 1460, 1461, 1489, 1490,
    1500, 1501, 1568, 1569, 1575, 1576, 1581, 1582, 1597, 1598, 1612, 1613, 1618, 1619,
    1662, 1663, 1675, 1676, 1680, 1681, 1713, 1714, 1722, 1723, 1725, 1726, 1745, 1746,
    1774, 1775, 1776, 1777, 1808, 1809, 1831, 1832,
}
for _, id in ipairs(blockedPlayerOutfits) do
    blocked[id] = true
end

-- Preparar una lista de candidatos una sola vez, sin consultar monstruos
local available = {}
for id = config.minLookType, config.maxLookType do
    if not blocked[id] then
        available[#available + 1] = id
    end
end

function randomOutfit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getItemCount(config.tokenId) < config.tokenCost then
        player:sendCancelMessage('You do not have enough tokens.')
        return true
    end
    if #available == 0 then
        player:sendCancelMessage('No outfits available.')
        return true
    end

    local id = available[math.random(#available)]
    local outfit = player:getOutfit()
    outfit.lookType = id
    outfit.lookAddons = 0

    -- Evitar cobro si el metodo falla o Canary devuelve false.
    -- En algunas versiones de Canary setOutfit no devuelve un estado fiable.
    local ok, result = pcall(function()
        return player:setOutfit(outfit)
    end)
    if not ok or result == false then
        player:sendCancelMessage('The outfit could not be applied. No tokens were charged.')
        return true
    end

    -- Confirmar que el cambio se reflejo en el outfit del jugador
    local applied = player:getOutfit()
    if not applied or applied.lookType ~= id then
        player:sendCancelMessage('The outfit was rejected. No tokens were charged.')
        return true
    end

    if not player:removeItem(config.tokenId, config.tokenCost) then
        player:sendCancelMessage('Could not remove tokens.')
        return true
    end

    -- player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'Your outfit has changed to lookType ' .. id .. '!')
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
    return true
end

randomOutfit:uid(config.uniqueId)
randomOutfit:register()
