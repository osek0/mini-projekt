import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectEntityManager } from '@nestjs/typeorm';
import { Connection, EntityManager } from 'typeorm';
import { Comment } from './comment.entity';
import { CommentStatus } from './comment.resources';

@Injectable()
export class CommentService {
  constructor(
    private connection: Connection,

    @InjectEntityManager()
    private manager: EntityManager,
  ) {}

  async getPostComments(postId: string) {
    const commentTree = await this.manager
      .getTreeRepository(Comment)
      .findTrees();

    return commentTree.filter((comment) => comment.postId === postId);
  }

  async removeComment(commentId: string) {
    await this.connection.transaction(async (manager) => {
      const comment = await manager.findOne(Comment, {
        where: { id: commentId },
        relations: ['children'],
        lock: { mode: 'pessimistic_write' },
      });

      if (!comment) throw new BadRequestException('comment-unknown');
      if (comment.status === CommentStatus.DELETED)
        throw new BadRequestException('comment-already-deleted');

      if (!comment.children.length) {
        return manager.delete(Comment, { id: comment.id });
      }

      return manager.update(
        Comment,
        { id: comment.id },
        {
          status: CommentStatus.DELETED,
          content: () => "CONCAT('Usunięty - <', CAST(NOW() AS CHAR), '>')",
        },
      );
    });
  }
}
