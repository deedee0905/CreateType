package com.amita.createType.ex.commision.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.commision.model.CommisionPost;
import com.amita.createType.ex.commision.model.CommisionProposal;

@Repository
public interface CommisionDAO {
	
	// 커미션 post insert
	public int insertCommisionPost(
			@Param("userId") int userId
			,@Param("channelId") int channelId
			,@Param("title") String title
			,@Param("content") String content
			,@Param("category") int category
			,@Param("minimumPrice") int minimumPrice
			,@Param("maximumPrice") int maximumPrice
			,@Param("deadline") int deadline
			,@Param("question") String question
			,@Param("thumbnail") String thumbnail
			);
	
	// 발행된 커미션 post 읽어오기
	public List<CommisionPost> selectCommisionCategory(@Param("category") int category);
	
	// commisionPost id 기반으로 포스트의 정보를 가져오기
	public CommisionPost selectCommisionPostInfoByPostId(@Param("id") int id);
	
	// channelView 에서 해당 채널의 사용자가 작성한 커미션 포스트 정보를 가져오기
	public List<CommisionPost> selectCommisionPost(@Param("channelId") int channelId);
	
	// commisionPost에 저장된 userId를 기반으로 정보를 가져오기
	public CommisionPost selectCommisionPostInfoByUserId(@Param("userId") int userId);
	
	// commisionPost에 저장된 userId를 기반으로 정보를 >여러개< 가져오기
	public List<CommisionPost> selectsCommisionPostsInfosByUserId(@Param("userId") int userId);
	
	// commisionPost에 저장된 userId를 기반으로 저장된 포스트의 개수를 세기
	public int selectCountPosts(@Param("userId") int userId);
	
	// 커미션 포스트 신청 insert
	public int insertCommisionProposal(
			@Param("userId") int userId
			, @Param("commisionPostId") int commisionPostId
			, @Param("postUserId") int postUserId
			, @Param("content") String content
			, @Param("processing") String processing
			);
	
	// 커미션 포스트 아이디로 해당 포스트의 정보를 얻기
	public CommisionPost selectPostInfoByCommisionPostId(@Param("id") int id);
	
	// 신청한 커미션 포스트 detail List
	public List<CommisionProposal> selectCommisionProposalList(@Param("userId") int userId);
	
	// 신청한 커미션 포스트의 내용 select
	public CommisionProposal selectCommisionPostInfoByCommisionProposalId(@Param("id") int id);
	
	// 신청받은 커미션 내역서를 세션에 저장된 userId 기반으로 가져오기
	public List<CommisionProposal> selectCommisionProposalListByUserId(@Param("postUserId") int postUserId);
	
	// 신청받은 커미션의 작업 상태를 변경하는 api
	public int updateCommisionProposalProcessingColumn(
			@Param("id") int id
			,@Param("processing") String processing
			);
	
	// 커미션 포스트 수정 update api
	public int updatePost(
			@Param("userId") int userId
			, @Param("commisionPostId") int commisionPostId
			, @Param("title") String title
			, @Param("content") String content
			, @Param("category") int category
			, @Param("minimumPrice") int minimumPrice
			, @Param("maximumPrice") int maximumPrice
			, @Param("deadline") int deadline
			, @Param("question") String question
			, @Param("thumbnail") String thumbnail
			);
	
	// 커미션 포스트 마감(update) api
	public int commisionPostFinishUpdate(
			@Param("userId") int userId
			, @Param("id") int id
			, @Param("deadline") int deadline
			);
	
}
