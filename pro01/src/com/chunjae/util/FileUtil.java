package com.chunjae.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtil {
    public static void saveImage(String root, String fname, byte[] data) {
        try{
            root += "/images/"; // 기본 저장소 이름
            File f = new File(root);
            if(!f.exists()) f.mkdir(); // 해당 폴더가 없는 경우 생성

            f = new File(root+"/"+fname); // 해당 폴더에 파일 저장
            FileOutputStream out = new FileOutputStream(f);
        } catch (IOException e) {
            System.out.println("IO 에러");
        }
    }
}
