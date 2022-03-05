import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';
import { CommentService } from './comment.service';

@Controller('/comment')
export class CommentController {
  constructor(private readonly commentService: CommentService) {}

  @Get('/:postId')
  getPostComments(@Param('postId') postId: string) {
    return this.commentService.getPostComments(postId);
  }

  @Post('/:postId')
  addComment(
    @Param('postId') postId: string,
    @Body('content') content: string,
    @Body('parentId') parentId?: string,
  ) {
    return this.commentService.addComment(postId, content, parentId);
  }

  @Delete('/:commentId')
  removeComment(@Param('commentId') commentId: string) {
    return this.commentService.removeComment(commentId);
  }
}
