package com.cos.blog.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DetailResponseDto {
	private BoardResponseDto boardDto;	// 안에 모든게 들어가있음
	private List<ReplyResponseDto> replyDtos;
}

