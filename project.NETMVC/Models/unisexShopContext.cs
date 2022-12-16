﻿using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class unisexShopContext : DbContext
    {
        public unisexShopContext()
        {
        }

        public unisexShopContext(DbContextOptions<unisexShopContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Color> Colors { get; set; }
        public virtual DbSet<CtBlog> CtBlogs { get; set; }
        public virtual DbSet<Custommer> Custommers { get; set; }
        public virtual DbSet<Evaluation2> Evaluation2s { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Shipper> Shippers { get; set; }
        public virtual DbSet<Size> Sizes { get; set; }
        public virtual DbSet<TransactStatus> TransactStatuses { get; set; }
        public virtual DbSet<UserEvaluation> UserEvaluations { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=DESKTOP-IHV1HOH\\MSSQLSERVER01;Database=unisexShop;Integrated Security=true;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Account>(entity =>
            {
                entity.ToTable("account");

                entity.Property(e => e.AccountId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("AccountID")
                    .IsFixedLength(true);

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.FullName).HasMaxLength(150);

                entity.Property(e => e.LastLogin).HasColumnType("datetime");

                entity.Property(e => e.Password).HasMaxLength(50);

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_account_roles");
            });

            modelBuilder.Entity<Blog>(entity =>
            {
                entity.HasKey(e => e.IdBlog);

                entity.ToTable("blog");

                entity.Property(e => e.IdBlog).HasColumnName("id_blog");

                entity.Property(e => e.AccountId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("AccountID")
                    .IsFixedLength(true);

                entity.Property(e => e.Author).HasMaxLength(150);

                entity.Property(e => e.CateId).HasColumnName("cateID");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasColumnName("createDate");

                entity.Property(e => e.Image)
                    .HasMaxLength(250)
                    .HasColumnName("image");

                entity.Property(e => e.IsHot).HasColumnName("isHot");

                entity.Property(e => e.IsNewfeed).HasColumnName("isNewfeed");

                entity.Property(e => e.ModifiedDate)
                    .HasColumnType("datetime")
                    .HasColumnName("modifiedDate");

                entity.Property(e => e.Published).HasColumnName("published");

                entity.Property(e => e.Title)
                    .HasMaxLength(250)
                    .HasColumnName("title");

                entity.HasOne(d => d.Cate)
                    .WithMany(p => p.Blogs)
                    .HasForeignKey(d => d.CateId)
                    .HasConstraintName("FK_blog_Category");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.HasKey(e => e.CateId);

                entity.ToTable("Category");

                entity.Property(e => e.CateId).HasColumnName("cateID");

                entity.Property(e => e.CateName).HasMaxLength(250);
            });

            modelBuilder.Entity<Color>(entity =>
            {
                entity.HasKey(e => e.IdColor);

                entity.ToTable("color");

                entity.Property(e => e.IdColor).HasColumnName("id_color");

                entity.Property(e => e.ColorName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("color_name");

                entity.Property(e => e.IdSp).HasColumnName("id_sp");

                entity.HasOne(d => d.IdSpNavigation)
                    .WithMany(p => p.Colors)
                    .HasForeignKey(d => d.IdSp)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_color_product");
            });

            modelBuilder.Entity<CtBlog>(entity =>
            {
                entity.HasKey(e => e.IdCtblog);

                entity.ToTable("ct_blog");

                entity.Property(e => e.IdCtblog).HasColumnName("id_ctblog");

                entity.Property(e => e.IdBlog).HasColumnName("id_blog");

                entity.Property(e => e.Image)
                    .HasMaxLength(50)
                    .HasColumnName("image");

                entity.HasOne(d => d.IdBlogNavigation)
                    .WithMany(p => p.CtBlogs)
                    .HasForeignKey(d => d.IdBlog)
                    .HasConstraintName("FK_ct_blog_blog");
            });

            modelBuilder.Entity<Custommer>(entity =>
            {
                entity.ToTable("custommer");

                entity.Property(e => e.CustommerId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("CustommerID")
                    .IsFixedLength(true);

                entity.Property(e => e.Avatar).HasMaxLength(255);

                entity.Property(e => e.Birthday).HasColumnType("datetime");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.FullName).HasMaxLength(150);

                entity.Property(e => e.LastLogin).HasColumnType("datetime");

                entity.Property(e => e.LocationId).HasColumnName("LocationID");

                entity.Property(e => e.Password).HasMaxLength(50);

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.HasOne(d => d.Location)
                    .WithMany(p => p.Custommers)
                    .HasForeignKey(d => d.LocationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_custommer_location");
            });

            modelBuilder.Entity<Evaluation2>(entity =>
            {
                entity.HasKey(e => e.IdDanhgia)
                    .HasName("PK_Table1");

                entity.ToTable("evaluation2");

                entity.Property(e => e.IdDanhgia).HasColumnName("id_danhgia");

                entity.Property(e => e.AccountId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("AccountID")
                    .IsFixedLength(true);

                entity.Property(e => e.EvaluationDate)
                    .HasColumnType("datetime")
                    .HasColumnName("evaluationDate");

                entity.Property(e => e.IdSp).HasColumnName("id_sp");

                entity.Property(e => e.Message)
                    .HasMaxLength(255)
                    .HasColumnName("message");

                entity.Property(e => e.Point).HasColumnName("point");

                entity.HasOne(d => d.IdSpNavigation)
                    .WithMany(p => p.Evaluation2s)
                    .HasForeignKey(d => d.IdSp)
                    .HasConstraintName("FK_evaluation2_product");
            });

            modelBuilder.Entity<Location>(entity =>
            {
                entity.ToTable("location");

                entity.Property(e => e.LocationId).HasColumnName("LocationID");

                entity.Property(e => e.Conscious)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.District)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Ward)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("order");

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.CustommerId)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("CustommerID")
                    .IsFixedLength(true);

                entity.Property(e => e.Note).HasMaxLength(255);

                entity.Property(e => e.OrderDate).HasColumnType("datetime");

                entity.Property(e => e.PaymentDate).HasColumnType("datetime");

                entity.Property(e => e.PaymentId).HasColumnName("PaymentID");

                entity.Property(e => e.ShipDate).HasColumnType("datetime");

                entity.Property(e => e.TransactStatusId).HasColumnName("TransactStatusID");

                entity.HasOne(d => d.Custommer)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.CustommerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_order_custommer");

                entity.HasOne(d => d.TransactStatus)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.TransactStatusId)
                    .HasConstraintName("FK_order_transactStatus");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.HasKey(e => e.OrderDetailsId);

                entity.ToTable("orderDetails");

                entity.Property(e => e.OrderDetailsId).HasColumnName("OrderDetailsID");

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.ShipDate).HasColumnType("datetime");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK_orderDetails_order");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.IdSp);

                entity.ToTable("product");

                entity.Property(e => e.IdSp).HasColumnName("id_sp");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.BestSeller).HasColumnName("bestSeller");

                entity.Property(e => e.CateId).HasColumnName("cateID");

                entity.Property(e => e.DateCreate)
                    .HasColumnType("datetime")
                    .HasColumnName("dateCreate");

                entity.Property(e => e.DateModified)
                    .HasColumnType("datetime")
                    .HasColumnName("dateModified");

                entity.Property(e => e.Discount).HasColumnName("discount");

                entity.Property(e => e.HomeFlag).HasColumnName("homeFlag");

                entity.Property(e => e.Image).HasColumnName("image");

                entity.Property(e => e.Name)
                    .HasMaxLength(250)
                    .HasColumnName("name");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.ShortDescrip)
                    .HasMaxLength(250)
                    .HasColumnName("shortDescrip");

                entity.Property(e => e.Status)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("status")
                    .IsFixedLength(true);

                entity.Property(e => e.Thumb)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("thumb");

                entity.Property(e => e.UnitslnStock).HasColumnName("unitslnStock");

                entity.Property(e => e.Video).HasColumnName("video");

                entity.HasOne(d => d.Cate)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CateId)
                    .HasConstraintName("FK_product_Category");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("roles");

                entity.Property(e => e.RoleId).HasColumnName("roleID");

                entity.Property(e => e.Descripsion)
                    .HasMaxLength(50)
                    .HasColumnName("descripsion");

                entity.Property(e => e.RoleName)
                    .IsRequired()
                    .HasMaxLength(40)
                    .HasColumnName("roleName");
            });

            modelBuilder.Entity<Shipper>(entity =>
            {
                entity.ToTable("shipper");

                entity.Property(e => e.ShipperId).HasColumnName("ShipperID");

                entity.Property(e => e.Company).HasMaxLength(150);

                entity.Property(e => e.Phone)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.ShipperName).HasMaxLength(250);
            });

            modelBuilder.Entity<Size>(entity =>
            {
                entity.HasKey(e => e.IdSize);

                entity.ToTable("size");

                entity.Property(e => e.IdSize).HasColumnName("id_size");

                entity.Property(e => e.IdSp).HasColumnName("id_sp");

                entity.Property(e => e.NameSize)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("nameSize")
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdSpNavigation)
                    .WithMany(p => p.Sizes)
                    .HasForeignKey(d => d.IdSp)
                    .HasConstraintName("FK_size_product");
            });

            modelBuilder.Entity<TransactStatus>(entity =>
            {
                entity.ToTable("transactStatus");

                entity.Property(e => e.TransactStatusId).HasColumnName("TransactStatusID");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<UserEvaluation>(entity =>
            {
                entity.HasKey(e => e.IdDanhgia);

                entity.ToTable("userEvaluation");

                entity.Property(e => e.IdDanhgia).HasColumnName("id_danhgia");

                entity.Property(e => e.AccountId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("AccountID")
                    .IsFixedLength(true);

                entity.Property(e => e.EvaluationDate)
                    .HasColumnType("datetime")
                    .HasColumnName("evaluationDate");

                entity.Property(e => e.IdSp).HasColumnName("id_sp");

                entity.Property(e => e.Message)
                    .HasMaxLength(255)
                    .HasColumnName("message");

                entity.Property(e => e.Point).HasColumnName("point");

                entity.HasOne(d => d.IdSpNavigation)
                    .WithMany(p => p.UserEvaluations)
                    .HasForeignKey(d => d.IdSp)
                    .HasConstraintName("FK_userEvaluation_product");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}