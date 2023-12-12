package com.fastcampus.ch4.controller;

import com.fastcampus.ch4.domain.CommentDto;
import com.fastcampus.ch4.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CommentController {

    @Autowired
    CommentService service;

    @ResponseBody
    @PatchMapping("/comments/{cno}")
    public ResponseEntity<String> write(@PathVariable Integer cno,@RequestBody CommentDto dto){
        //        String commenter = (String)session.getAttribute("id");
        String commenter = "asdf";
        dto.setCommenter(commenter);
        dto.setCno(cno);
        System.out.println("dto ="+dto);

        try {
            if(service.modify(dto) != 1)
                throw new Exception("Write failed!");
            return new ResponseEntity<>("MOD_OK",HttpStatus.OK);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    @ResponseBody
    @PostMapping("/comments")
    public ResponseEntity<String> write(@RequestBody CommentDto dto ,Integer bno, HttpSession session){
        //        String commenter = (String)session.getAttribute("id");
        String commenter = "asdf";
        dto.setCommenter(commenter);
        dto.setBno(bno);
        System.out.println("dto ="+dto);

        try {
            if(service.write(dto) != 1)
                throw new Exception("Write failed!");
            return new ResponseEntity<>("WRT_OK",HttpStatus.OK);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


        @DeleteMapping("/comments/{cno}")
    @ResponseBody
    public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session){
//        String commenter = (String)session.getAttribute("id");
        String commenter = "asdf";
        try {
            int rowCnt = service.remove(cno,bno,commenter);
            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/comments")
    @ResponseBody
    public ResponseEntity<List<CommentDto>> list(Integer bno){
        List<CommentDto> list = null;
        try {
            list = service.getList(bno);
            System.out.println("list = " + list);
            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            throw new RuntimeException(e);

        }
    }
}
