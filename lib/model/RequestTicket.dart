
import 'package:flutter/material.dart';

class RequestTicket {
  final int film_id;
  final String user_name;
  final String status;
  final String status_color;
  final int posted_by;

  RequestTicket({this.film_id,this.user_name,this.status,this.status_color,this.posted_by});

  Map<String, dynamic> toJson() => {
    'film_id': film_id,
    'user_name': user_name,
    'status':status,
    'status_color':status_color,
    'posted_by':posted_by
  };
}