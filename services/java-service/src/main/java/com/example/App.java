package com.example;

import spark.Spark;

public class App {
    public static void main(String[] args) {
        Spark.port(3005);
        Spark.get("/", (req, res) -> {
            res.type("application/json");
            return "{\"message\": \"Hello from Java Service!\"}";
        });
        System.out.println("🚀 Java service running on port 3005");
    }
}
