import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
  Tree,
  TreeChildren,
  TreeParent,
} from 'typeorm';
import { Post } from '../post/post.entity';
import { CommentStatus } from './comment.resources';

@Entity()
@Tree('nested-set')
export class Comment {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  content: string;

  @Column({
    type: 'tinyint',
    width: 3,
    unsigned: true,
    default: CommentStatus.NORMAL,
  })
  status: CommentStatus;

  @CreateDateColumn()
  createdAt: Date;

  @ManyToOne(() => Post, (post) => post.comments)
  post: Post;

  @Column()
  postId: string;

  @TreeChildren()
  children: Comment[];

  @TreeParent()
  parent: Comment;
}
