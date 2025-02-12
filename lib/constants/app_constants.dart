import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const String kAppName = "İycoffee";
const String appFont = "Poppins";

const Color kGreen = Color(0xFF7BC74D);
const Color kBlack = Color(0xFF222831);
const Color kLightBlack = Color(0xFF393E46);
const Color kWhite = Color(0xff7eeeeee);
const Color kLightGreen = Color(0xFFC4DAD2);
const Color kHintColor= Color(0xFFC7C8CC);
const Color kBlueColor= Colors.blueAccent;


const TextStyle kTitleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 17, fontFamily: appFont);
const TextStyle kCustomTextStyle = TextStyle(fontSize: 15, fontFamily: appFont, color: kWhite);

const InputDecoration kInputDecoration = InputDecoration(
  border: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  focusedErrorBorder: InputBorder.none,
);

const InputDecoration kInputDecorationWithNoBorder = InputDecoration(
  border: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  focusedErrorBorder: InputBorder.none,
);

bool isUserAnonymous() => FirebaseAuth.instance.currentUser!.isAnonymous;
String currentUserUid = FirebaseAuth.instance.currentUser!.uid;

Uri appUrl = Uri.parse('https://salihbalkis.com/get.php');
//Uri appUrl = Uri.parse('http://coral-lemur-335530.hostingersite.com/get.php');

const String kApiKey = "AIzaSyDZg_ZZdVGiLpdwBs3pbnP6sl4JaEquLY8";

const String kFcmUrl = 'https://fcm.googleapis.com/fcm/send';
const String kServerKey = 'ya29.c.c0ASRK0GYyTklHCM-RRRo38hlbBy8Iohg1ZA7KPYXk-h5GESmwF5jHHxXHGu0VOY6mqfWnGO0TAPpIbIphk-4zwmV0EDviT0wATYFmqUshV98AhLtbgtfttigB6a6HWMi6_Wu0j6ycRuOebulKcwp7dy3n69CKmCjsRSC29Ij9EED8U4HprXCdIjFjrjuwvwa95mN5l8FHEvKpBzFxTI4sGWWZsMjLTlwDrLSmvzpGClGSuoMbq05XggNbYs6ZBU66I1CDrDtRlpDOLVrYNUbqedzCMcyj8kcQABVIdoj6ocyYeWBfnXSDrYslm5wjioDJg1-rJEy480L9TsVCOwtL16lD1vyU-MNgDZ6hDOMFarSrgWq2xhaH3PW2N9j5H389PUnWR3S-qFvs4yObdOymq5QqSwZUpeeRZ5Xphk9lg56QUWwRuuquWQgovfXquXFmnBj6reXOI7Xe2J070sMjznMjkacvdtyZYnMv_zBh8-a4VxMSMlj94wenFyrkvlbJis44umSWxwFXk1Rr3qn_-3ruFX8FX48JhXQIeyV7-_wb_Y4ai2ojVe6x4z4wOp_ookmtR-uiWf-bwVcf_mSMvZway5aZtrVYF2uetF5-hwBrnt5qQ-2MiQR7Ba6veZB_iJfU85UwWxsmYetS_ieQdB6Ws_R1hOxzZxV_uMk722ZaxXwO_dkUwbZZedSZS2bbUq9O6ZhZmJSo9ZeseXOxzRBb3p5W8Sr994wx7coZmIr-XZIlbjWf0sZj5f-ZRfhJYf5SSW1Bbk4zZ13d0y1qmzqMF7l8aMcyFursYi94pkoMfbnnyW0beh4IVxw3i9WW7S73_x08x_OJhearUhcmminWzZp4cm9pRiRsMhpQtRnieeeeXwt_OvOsay3aixZFWb_UnkkV3B4887k-iZdVvUcdIdYkWIewhZbmqBRR07es_k46_sgvmpQ2Rx20g4cpyz1BYt-erVtIj4XRBOS14nQFIFUX5dOMW78Uiyl-rzcgx-RfRW8tub'; //
const String kProjectId = "yukbultr";

const String kClientEmail = "firebase-adminsdk-s11c0@yukbultr.iam.gserviceaccount.com";
const String kPrivateKey = "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCh/T1LSvCW9cW1\nELpiOynnSrh8ZJLWJQZvnFiSY+HA9EdT/EmWxqI1yrOo7s70h4FC5sXzoFVnrQ+2\nV55ZK2GcR58VgegNCJNIPtP5WmKDY6V3UFEe2bQzNdbGy/Se5nOISk5MPT9tb9VW\nDtaaTmlXlSK/FNY6ngvdgeHbYa+XjT5e2qG3ShLlsrwIKkVUMB3aWjyYVP/pxgNF\n32SjhEmzGkkEy6wDBA2DhTuPTgaxG+PyJrS3vuKWQqjRrwyP2b6HLfYeomYdnHzG\nzQRVO814q5+ZIr0if7DaH83vTFAr/Kspc5ghP1TQ3feREyRKu5ZJ75gIAbMJlnYe\njl0/Px89AgMBAAECggEABoqZ64zyqz3whm/O/wGBny/yxD8xeMlU+bPYFc1HxAl5\nSehxtk9+JGrzl1pRbCl+rEtyafSrDj08WbIvGE26qttvjqhIzSHwBKZY3ARs3v5q\no6dQJ01GTB0b97orvjDzMGlDwStmAM7X0BpYSzHoahuBJDM8tXBFbWP90WSf+SAw\nBcNDJHO5ojuCrGHmq87Snod850gI1jgfeKCIawV/eSjeRCqYJPPNF9VoHY4ZWAcm\nmq71PWm8+K8p6KdyKqvPF4v801TG7F3Gz/nSL6EUXshznG9YWrds7zmqELqpF12+\nB9ggjoaTdSidyM2lyS7/NVe9DD44eL1uzlOoromCQQKBgQDeurlk1fT+xKh2CTH6\niA2PPBGFChfPp/Dx9g0dYEIDMpwvmaygZJlBFOPBZl3HZdKHfgFkxG3AIqphwgPN\nvZH8AL+FNYKCM/pMq/mYPgtQ4PByhZcxV6+TltD5+CVxOIabs4O1aTgiR3FanUNE\nJFZGnMk+jYDLlbX5mtqU1VA5XQKBgQC6L8hZyD5KQSQcHyA8s+eCccb1Sut8v0wH\na8bDUM82uC1Jif37RETHVzjFLc17ZoRaxuTAXW78yDjLaFZhfQOJ5xtca8yIDVtE\nM1WbcgsA1obziDUjBqmmH5q78B3wy5+2mrpnFMfjY0GreErccTCzIcPKahTh8VjQ\n4zpiS3G/YQKBgQDZP2BeDqOtbLy0hTuOlu5C6+Ba2AFptvG50LnyEVXSMKdPdqF+\nwSEK7glJN0P5nkO/jRRm6YHzityOBeQX5fRizYgBsrPdtD1MU+JcsQfwl7dwvQVA\nR7smRlEHwRckXHJPpMWvSTZLmUvjisl1ycutjHhu3y7lZN3e3UCfM4HQsQKBgAD8\nXcgz6jiEbceEVqxbm38yUQZddi+755Amfu/rzp0QjpTUGTcqXl7b1F4e5vafTVYZ\ntX5bQEowWTSigcqUWd9yDNAJdhTGVVRgHTTsfqhrel1xvC5KS72oby5NkCsFOPxD\nh3ciQgivLtrUkTjnlIVuSVYaB7BGkdzRRy7cDWchAoGAIiit/18z/Ka3ZhWvrkun\nq/DB3jDIyBW/D8w73q2RGkEA2yMPhdMXrYDiTzua5Cx9kWzQd2S6H1qyPB7pA4ub\nJcehoSgA8ehPf8FJZgd26OQZAOVyXv+RFojYuaK2hzRELrvhwDNoHa8djfPrszHT\nzkeFZkkHH+Md7vcocSM1m2s=\n-----END PRIVATE KEY-----\n";

const String kServiceAccountKey = '''
  {
  "type": "service_account",
  "project_id": "yukbultr",
  "private_key_id": "4c636ba61ce0c60aed3acfff4bb953924df0ba92",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCh/T1LSvCW9cW1\nELpiOynnSrh8ZJLWJQZvnFiSY+HA9EdT/EmWxqI1yrOo7s70h4FC5sXzoFVnrQ+2\nV55ZK2GcR58VgegNCJNIPtP5WmKDY6V3UFEe2bQzNdbGy/Se5nOISk5MPT9tb9VW\nDtaaTmlXlSK/FNY6ngvdgeHbYa+XjT5e2qG3ShLlsrwIKkVUMB3aWjyYVP/pxgNF\n32SjhEmzGkkEy6wDBA2DhTuPTgaxG+PyJrS3vuKWQqjRrwyP2b6HLfYeomYdnHzG\nzQRVO814q5+ZIr0if7DaH83vTFAr/Kspc5ghP1TQ3feREyRKu5ZJ75gIAbMJlnYe\njl0/Px89AgMBAAECggEABoqZ64zyqz3whm/O/wGBny/yxD8xeMlU+bPYFc1HxAl5\nSehxtk9+JGrzl1pRbCl+rEtyafSrDj08WbIvGE26qttvjqhIzSHwBKZY3ARs3v5q\no6dQJ01GTB0b97orvjDzMGlDwStmAM7X0BpYSzHoahuBJDM8tXBFbWP90WSf+SAw\nBcNDJHO5ojuCrGHmq87Snod850gI1jgfeKCIawV/eSjeRCqYJPPNF9VoHY4ZWAcm\nmq71PWm8+K8p6KdyKqvPF4v801TG7F3Gz/nSL6EUXshznG9YWrds7zmqELqpF12+\nB9ggjoaTdSidyM2lyS7/NVe9DD44eL1uzlOoromCQQKBgQDeurlk1fT+xKh2CTH6\niA2PPBGFChfPp/Dx9g0dYEIDMpwvmaygZJlBFOPBZl3HZdKHfgFkxG3AIqphwgPN\nvZH8AL+FNYKCM/pMq/mYPgtQ4PByhZcxV6+TltD5+CVxOIabs4O1aTgiR3FanUNE\nJFZGnMk+jYDLlbX5mtqU1VA5XQKBgQC6L8hZyD5KQSQcHyA8s+eCccb1Sut8v0wH\na8bDUM82uC1Jif37RETHVzjFLc17ZoRaxuTAXW78yDjLaFZhfQOJ5xtca8yIDVtE\nM1WbcgsA1obziDUjBqmmH5q78B3wy5+2mrpnFMfjY0GreErccTCzIcPKahTh8VjQ\n4zpiS3G/YQKBgQDZP2BeDqOtbLy0hTuOlu5C6+Ba2AFptvG50LnyEVXSMKdPdqF+\nwSEK7glJN0P5nkO/jRRm6YHzityOBeQX5fRizYgBsrPdtD1MU+JcsQfwl7dwvQVA\nR7smRlEHwRckXHJPpMWvSTZLmUvjisl1ycutjHhu3y7lZN3e3UCfM4HQsQKBgAD8\nXcgz6jiEbceEVqxbm38yUQZddi+755Amfu/rzp0QjpTUGTcqXl7b1F4e5vafTVYZ\ntX5bQEowWTSigcqUWd9yDNAJdhTGVVRgHTTsfqhrel1xvC5KS72oby5NkCsFOPxD\nh3ciQgivLtrUkTjnlIVuSVYaB7BGkdzRRy7cDWchAoGAIiit/18z/Ka3ZhWvrkun\nq/DB3jDIyBW/D8w73q2RGkEA2yMPhdMXrYDiTzua5Cx9kWzQd2S6H1qyPB7pA4ub\nJcehoSgA8ehPf8FJZgd26OQZAOVyXv+RFojYuaK2hzRELrvhwDNoHa8djfPrszHT\nzkeFZkkHH+Md7vcocSM1m2s=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-s11c0@yukbultr.iam.gserviceaccount.com",
  "client_id": "108037952352600440166",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-s11c0%40yukbultr.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

  ''';
