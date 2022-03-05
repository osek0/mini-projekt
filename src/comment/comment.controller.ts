import { Controller, Delete, Get, Param } from '@nestjs/common';
import { CommentService } from './comment.service';

@Controller('/comment')
export class CommentController {
  constructor(private readonly commentService: CommentService) {}

  @Get('/:postId')
  getPostComments(@Param('postId') postId: string) {
    return this.commentService.getPostComments(postId);
  }

  @Delete('/:commentId')
  removeComment(@Param('commentId') commentId: string) {
    return this.commentService.removeComment(commentId);
  }
}
